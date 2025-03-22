import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/register_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_modal.dart';
import 'package:mobile/app/presentation/widgets/card_common.dart';
import 'package:mobile/app/presentation/widgets/register_progress.dart';
import 'package:mobile/app/presentation/widgets/scrollable_constraints.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class RegisterEoConfirmPage extends GetView<RegisterController> {
  const RegisterEoConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableConstraints(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      "5/5: ",
                      style: h5BTextStyle(
                        color: ColorConstants.slate[400],
                      ),
                    ),
                    Text(
                      " Konfirmasi Data Usaha",
                      style: h5BTextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                RegisterProgress(currentStep: 5),
                SizedBox(height: 20.h),
                CardCommon(
                  title: "Detail Perusahaan",
                  contents: [
                    ["Nama Perusahaan", controller.formEo['name']!.text],
                    ["NIB", controller.formEo['nib']!.text],
                    [
                      "Nama Person in Charge (PIC)",
                      controller.formEo['pic']!.text
                    ],
                    ["No. Telp", controller.formEo['picPhone']!.text],
                    ["Email Perusahaan", controller.formEo['email']!.text],
                    ["Nomor Rekening", "***********7446"],
                    ["Lokasi Perusahaan", controller.formEo['address']!.text],
                  ],
                  child: Container(),
                ),
                SizedBox(height: 24.h),
                CardCommon(
                  title: "Surat Izin Usaha",
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/document.svg",
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12.w),
                      Flexible(
                        child: Text(
                          controller.eoDocument.value!.path.split("/").last,
                          maxLines: 2,
                          style: body4TextStyle(),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
                SizedBox(height: 20.h),
                AppButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AppModal(
                          primaryText: "Konfirmasi",
                          secondaryText: "Kembali",
                          description:
                              "Pastikan datanya sudah benar dan sesuai demi kelancaran proses pendaftaran. Jika ada yang salah, hubungi Call Center 14021 atau agen kantor Cabang Bank Mandiri.",
                          onPrimary: controller.registerEo,
                          onSecondary: () {
                            Get.back();
                          },
                          title: "Konfirmasi Data Usaha",
                        ),
                      );
                    },
                    text: "Konfirmasi")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
