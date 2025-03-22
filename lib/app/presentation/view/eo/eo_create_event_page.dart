import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_detail_event_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/app_input_file.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/datepicker.dart';
import 'package:mobile/utils/input_validator.dart';

class EoCreateEventPage extends GetView<EoDetailEventController> {
  final bool isEdit;
  const EoCreateEventPage({
    super.key,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Buat Event",
        child: Obx(
          () => Form(
            key: controller.formKey,
            child: Column(
              children: [
                AppInput(
                  controller: controller.form['name']!,
                  label: "Nama Event",
                  placeholder: "Input Nama Event",
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Nama event"),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Expanded(
                      child: AppInput(
                        controller: controller.form['date']!,
                        label: "Tanggal",
                        placeholder: "Input Tanggal",
                        textInputAction: TextInputAction.next,
                        validator: (e) => inputValidator(e, "Tanggal"),
                        readOnly: true,
                        onTap: () {
                          datePicker(controller.form['date']!);
                        },
                        suffixIcon: Icon(
                          Icons.date_range,
                          size: 20.w,
                          color: ColorConstants.slate[600],
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppInput(
                        controller: controller.form['time']!,
                        label: "Waktu",
                        placeholder: "Input Tanggal",
                        textInputAction: TextInputAction.next,
                        validator: (e) => inputValidator(e, "Tanggal"),
                        readOnly: true,
                        onTap: () {
                          timePicker(controller.form['time']!);
                        },
                        suffixIcon: Icon(
                          Icons.access_time_rounded,
                          size: 20.w,
                          color: ColorConstants.slate[600],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                AppDropdown<String>(
                  label: "Kategori Event",
                  placeholder: "Input Kategori Event",
                  value: controller.category.value,
                  validator: (e) => inputValidator(e, "Kategori event"),
                  items: ["Bazaar", "Festival Makanan", "Konser", "Pameran"]
                      .map((e) => AppDropdownItem(text: e, value: e))
                      .toList(),
                  onChanged: (e) {
                    if (e == null) {
                      return;
                    }
                    controller.category.value = e;
                    controller.form['category']!.text = e;
                  },
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: controller.form['location']!,
                  label: "Lokasi",
                  placeholder: "Pilih Lokasi",
                  suffixIcon: Icon(
                    Icons.location_on,
                    size: 20.w,
                    color: ColorConstants.slate[600],
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Lokasi"),
                  readOnly: true,
                  onTap: () {
                    Get.toNamed(AppRoute.eoEventMap);
                  },
                ),
                SizedBox(height: 12.h),
                AppDropdown<String>(
                  label: "Tipe Venue",
                  placeholder: "Input Tipe Venue",
                  value: controller.venue.value,
                  validator: (e) => inputValidator(e, "Tipe Venue"),
                  items: ["Outdoor", "Indoor"]
                      .map((e) => AppDropdownItem(text: e, value: e))
                      .toList(),
                  onChanged: (e) {
                    if (e == null) {
                      return;
                    }
                    controller.venue.value = e;
                    controller.form['venue']!.text = e;
                  },
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: controller.form['visitorNumber']!,
                  label: "Estimasi Jumlah Pengunjung",
                  placeholder: "Input Estimasi Jumlah Pengunjung",
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Jumlah pengunjung"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: controller.form['tenantNumber']!,
                  label: "Jumlah Tenant",
                  placeholder: "Input Jumlah Tenant",
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Jumlah Tenant"),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: controller.form['tenantPrice']!,
                  label: "Biaya Tenant",
                  placeholder: "Input Biaya Tenant",
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Biaya Tenant"),
                  keyboardType: TextInputType.number,
                  prefixIcon: Center(
                    child: Text(
                      " Rp |",
                      style: body4TextStyle(color: ColorConstants.slate[500]),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                AppInput(
                  controller: controller.form['description']!,
                  label: "Deskripsi",
                  placeholder: "Input Deskripsi",
                  textInputAction: TextInputAction.next,
                  validator: (e) => inputValidator(e, "Deskripsi"),
                  maxLines: 5,
                ),
                SizedBox(height: 12.h),
                AppInputFile(
                  extensions: ["jpg", "png"],
                  label: "Banner",
                  onChange: (e) {
                    controller.banner.value = e;
                  },
                  onRemove: () {
                    controller.banner.value = null;
                  },
                  file: controller.banner.value,
                ),
                SizedBox(height: 20.h),
                AppButton(
                  onPressed: controller.handleAddSubmit,
                  width: 1.sw,
                  text: "Tambah Event",
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
