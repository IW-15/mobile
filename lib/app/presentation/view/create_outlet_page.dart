import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/create_outlet_controller.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/utils/input_validator.dart';

class CreateOutletPage extends GetView<CreateOutletController> {
  final bool edit;
  const CreateOutletPage({
    super.key,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: edit ? "Edit Outlet" : "Tambah Outlet",
        child: Obx(
          () => Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppInput(
                  controller: controller.form['name']!,
                  label: "Nama Outlet",
                  placeholder: "Input nama outlet",
                  validator: (e) => inputValidator(e, "Nama outlet"),
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 16.h),
                AppDropdown<String>(
                  value: controller.id_revenue.value,
                  label: "Pendapatan per Bulan",
                  items: GlobalController.i.revenue
                      .map(
                        (e) => AppDropdownItem(
                          text: e.label,
                          value: e.id.toString(),
                        ),
                      )
                      .toList(),
                  onChanged: (e) {
                    if (e != null) {
                      controller.form['id_revenue']!.text = e;
                      controller.id_revenue.value = e;
                    }
                  },
                  placeholder: "Input pendapatan per bulan",
                  validator: (e) => inputValidator(e, "Pendapatan"),
                ),
                SizedBox(height: 16.h),
                AppDropdown(
                  value: controller.type.value,
                  label: "Tipe",
                  placeholder: "Input Type Outlet",
                  validator: (e) => inputValidator(e, "Tipe Outlet"),
                  onChanged: (e) {
                    if (e != null) {
                      controller.type.value = e;
                      controller.form['type']!.text = e;
                    }
                  },
                  items: [
                    AppDropdownItem(
                        text: "Perseorangan", value: "Perseorangan"),
                    AppDropdownItem(text: "Badan Usaha", value: "Badan Usaha"),
                  ],
                ),
                SizedBox(height: 16.h),
                AppInput(
                  controller: controller.form['phone']!,
                  label: "Nomor Telepon",
                  placeholder: "Input Nomor Telepon",
                  validator: (e) => inputValidator(e, "Nomor Telepon"),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                !edit
                    ? Column(
                        children: [
                          SizedBox(height: 16.h),
                          AppInput(
                            controller: controller.form['email']!,
                            label: "Alamat Email",
                            placeholder: "Input Alamat Email",
                            validator: (e) => inputValidator(e, "Alamat email"),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(height: 16.h),
                AppInput(
                  controller: controller.form['address']!,
                  label: "Alamat Outlet",
                  placeholder: "Input Alamat Outlet",
                  validator: (e) => inputValidator(e, "Alamat outlet"),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  maxLines: 5,
                ),
                SizedBox(height: 20.h),
                Expanded(child: Container()),
                !edit
                    ? AppButton(
                        onPressed: controller.submit,
                        text: "Tambah Outlet",
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              onPressed: () {
                                Get.back();
                              },
                              variant: AppButtonVariant.secondary,
                              text: "Kembali",
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: AppButton(
                              onPressed: controller.updateData,
                              text: "Perbarui",
                            ),
                          ),
                        ],
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
