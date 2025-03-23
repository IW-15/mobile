import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/sme/sme_detail_event_controller.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_dialog.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/input_validator.dart';
import 'package:get/get.dart';

class CardEventConfirmRegist extends GetView<SmeDetailEventController> {
  final List<OutletModel> outlets;
  const CardEventConfirmRegist({
    super.key,
    required this.outlets,
  });

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      child: Obx(
        () => Column(
          children: [
            Text(
              "Konfirmasi Pendaftaran",
              style: h5BTextStyle(),
            ),
            SizedBox(height: 12.h),
            AppDropdown<int>(
              placeholder: "Pilih Outlet",
              items: outlets
                  .map((e) => AppDropdownItem(text: e.name, value: e.id))
                  .toList(),
              validator: (e) => inputValidator(e.toString(), "Outlet"),
              value: controller.selectedOutlet.value,
              onChanged: (e) {
                controller.selectedOutlet.value = e;
              },
            ),
            SizedBox(height: 12.h),
            Text(
              "Pastikan kamu telah membaca detail event sebelum mendaftar menjadi tenant.",
              style: body5TextStyle(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onPressed: controller.selectedOutlet.value == null
                        ? null
                        : controller.handleConfirm,
                    text: "Konfirmasi",
                    textStyle: body4BTextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: AppButton(
                    variant: AppButtonVariant.secondary,
                    onPressed: () {},
                    text: "Batal",
                    type: AppButtonType.outlined,
                    textStyle: body4BTextStyle(
                      color: ColorConstants.primary[500],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
