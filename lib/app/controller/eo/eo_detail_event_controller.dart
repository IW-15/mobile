import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/app/presentation/widgets/app_modal.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/utils/get_id.dart';

class EoDetailEventController extends GetxController {
  static EoDetailEventController get i => Get.find<EoDetailEventController>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  void handleAddSubmit() {
    if (formKey.currentState!.validate()) {
      Get.offNamedUntil(
        AppRoute.eoEventDraft,
        ModalRoute.withName(AppRoute.eoEvent),
      );
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
        onPrimary: () {
          Get.back();
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
        onPrimary: () {
          Get.offNamedUntil(
            AppRoute.eoEventPublish(getId()),
            ModalRoute.withName(AppRoute.eoEvent),
          );
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
}
