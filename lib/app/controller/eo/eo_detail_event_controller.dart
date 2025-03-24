import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:mobile/app/controller/eo/eo_event_controller.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/presentation/widgets/app_loading.dart';
import 'package:mobile/app/presentation/widgets/app_modal.dart';
import 'package:mobile/app/repository/eo_event_repo.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/format_date.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:dio/dio.dart' show FormData, MultipartFile;
import 'package:mobile/utils/show_alert.dart';

class EoDetailEventController extends GetxController {
  static EoDetailEventController get i => Get.find<EoDetailEventController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rxn<EventModel> data = Rxn<EventModel>();

  RxMap<String, TextEditingController> form = {
    "name": TextEditingController(),
    "date": TextEditingController(),
    "time": TextEditingController(),
    "category": TextEditingController(),
    "location": TextEditingController(),
    "latitude": TextEditingController(),
    "longitude": TextEditingController(),
    "venue": TextEditingController(),
    "visitorNumber": TextEditingController(),
    "tenantNumber": TextEditingController(),
    "tenantPrice": TextEditingController(),
    "description": TextEditingController(),
  }.obs;

  RxnString category = RxnString();
  RxnString venue = RxnString();

  Rxn<File> banner = Rxn<File>();
  RxBool isLoading = false.obs;

  void handleAddSubmit() async {
    if (formKey.currentState!.validate()) {
      try {
        showLoadingDialog(Get.context!, isLoading);
        var inputForm = {
          'name': form['name']!.text,
          'date': form['date']!.text,
          'time': form['time']!.text,
          'category': form['category']!.text,
          'location': form['location']!.text,
          'latitude': form['latitude']!.text,
          'longitude': form['longitude']!.text,
          'venue': form['venue']!.text,
          'visitorNumber': form['visitorNumber']!.text,
          'tenantNumber': form['tenantNumber']!.text,
          'tenantPrice': form['tenantPrice']!.text,
          'description': form['description']!.text,
          'banner': await MultipartFile.fromFile(banner.value!.path),
        };

        final formData = FormData.fromMap(inputForm);
        await EoEventRepo.create(formData);
        EoEventController.i.getAllEvent();

        await closeLoading(isLoading);
        Get.toNamed(AppRoute.eoEventDraft);
      } catch (error) {
        printError(info: error.toString());
        showAlert(error.toString());
      }
      await closeLoading(isLoading);
    }
  }

  void handleEdit() {
    Get.toNamed(AppRoute.eoEditEvent(getId()));
  }

  void handleDelete() {
    showDialog(
      context: Get.context!,
      builder: (context) => AppModal(
        primaryText: "Hapus",
        secondaryText: "Batal",
        onPrimary: () async {
          try {
            showLoadingDialog(context, isLoading);
            await EoEventRepo.delete(getId());
            EoEventController.i.getAllEvent();
            await closeLoading(isLoading);
            showAlert("Success delete event data", isSuccess: true);
            Get.until(ModalRoute.withName(
              AppRoute.eoEvent,
            ));
          } catch (_) {
            await closeLoading(isLoading);
          }
        },
        onSecondary: () {
          Get.back();
        },
        title: "Hapus Event",
        isError: true,
        description:
            "Anda yakin untuk menghapus event ini secara permanen? Event yang sudah dihapus tidak bisa dikembalikan",
      ),
    );
  }

  void handlePublikasi() {
    showDialog(
      context: Get.context!,
      builder: (context) => AppModal(
        primaryText: "Publikasi",
        secondaryText: "Batal",
        onPrimary: () async {
          try {
            showLoadingDialog(context, isLoading);
            await EoEventRepo.publish(getId());
            EoEventController.i.getAllEvent();
            Get.offNamedUntil(
              AppRoute.eoEventPublish(getId()),
              ModalRoute.withName(AppRoute.eoEvent),
            );
          } catch (_) {
            await closeLoading(isLoading);
          }
        },
        onSecondary: () {
          Get.back();
        },
        title: "Publikasikan Event",
        description:
            "Pastikan informasi terkait event kamu sudah benar. Event yang sudah dipublikasikan tidak dapat diedit atau dihapus.",
      ),
    );
  }

  void getDetailEvent() async {
    try {
      final res = await EoEventRepo.getDetail(getId());
      data.value = res;
      form["date"]!.text = formatDate(res.date);
      form["name"]!.text = res.name;
      form["time"]!.text = res.time;
      form["category"]!.text = res.category;
      category.value = res.category;
      form["location"]!.text = res.location;
      form["latitude"]!.text = res.latitude.toString();
      form["longitude"]!.text = res.longitude.toString();
      form["venue"]!.text = res.venue;
      venue.value = res.venue;
      form["visitorNumber"]!.text = res.visitorNumber.toString();
      form["tenantNumber"]!.text = res.tenantNumber.toString();
      form["tenantPrice"]!.text = res.tenantPrice.toString();
      form["description"]!.text = res.description.toString();
    } catch (e) {
      showAlert(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    if (!Get.currentRoute.contains("create")) {
      getDetailEvent();
    }
  }
}
