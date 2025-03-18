import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_onboard_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/app/presentation/widgets/app_input_file.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';

class LoanDocumentPage extends GetView<LoanOnboardController> {
  const LoanDocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Dokumen Tambahan",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppDropdown<int>(
                items: controller.outlets
                    .map(
                      (e) => AppDropdownItem(
                        text: e.name,
                        value: e.id,
                      ),
                    )
                    .toList(),
                label: "Outlet",
                placeholder: "Pilih Outlet",
                value: controller.selectedOutlet.value,
                onChanged: (e) {
                  if (e != null) {
                    controller.selectedOutlet.value = e;
                  }
                },
              ),
              SizedBox(height: 8.h),
              AppInputFile(
                extensions: ["jpg", "png", "jpeg", "pdf"],
                onChange: (e) {
                  controller.ktp.value = e;
                },
                onRemove: () {
                  controller.ktp.value = null;
                },
                file: controller.ktp.value,
                label: "KTP",
              ),
              SizedBox(height: 8.h),
              AppInputFile(
                extensions: ["jpg", "png", "jpeg", "pdf"],
                onChange: (e) {
                  controller.kk.value = e;
                },
                onRemove: () {
                  controller.kk.value = null;
                },
                file: controller.kk.value,
                label: "Kartu Keluarga",
              ),
              SizedBox(height: 8.h),
              AppInputFile(
                extensions: ["jpg", "png", "jpeg", "pdf"],
                onChange: (e) {
                  controller.suratNikah.value = e;
                },
                onRemove: () {
                  controller.suratNikah.value = null;
                },
                file: controller.suratNikah.value,
                label: "Surat Nikah atau Surat Cerai",
              ),
              SizedBox(height: 8.h),
              AppInputFile(
                extensions: ["jpg", "png", "jpeg", "pdf"],
                onChange: (e) {
                  controller.suratKeterangan.value = e;
                },
                onRemove: () {
                  controller.suratKeterangan.value = null;
                },
                file: controller.suratKeterangan.value,
                label: "Surat Keterangan Usaha",
              ),
              SizedBox(height: 8.h),
              AppInputFile(
                extensions: ["jpg", "png", "jpeg", "pdf"],
                onChange: (e) {
                  controller.npwp.value = e;
                },
                onRemove: () {
                  controller.npwp.value = null;
                },
                file: controller.npwp.value,
                label: "NPWP",
              ),
              SizedBox(height: 20.h),
              AppButton(
                onPressed:
                    controller.checkValid() ? controller.submitFile : null,
                text: "Ajukan",
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
