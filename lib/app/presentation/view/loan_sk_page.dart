import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/loan_onboard_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class LoanSkPage extends GetView<LoanOnboardController> {
  const LoanSkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Syarat dan Ketentuan",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              textWidget("1. Persyaratan Umum", isHead: true),
              textWidget(
                "a. Merchant harus memiliki akun aktif di Livin' Merchant selama minimal 3 bulan.\nb. Memiliki rekam transaksi yang stabil dalam 3 bulan terakhir.\nc. Menyetujui analisis data transaksi oleh AI untuk penentuan skor kredit dan batas pinjaman.\n",
              ),
              textWidget(
                "2. Proses Pengajuan",
                isHead: true,
              ),
              textWidget(
                "a. Merchant wajib melengkapi formulir registrasi dan mengunggah dokumen yang diperlukan.\nb. Bank Mandiri akan melakukan analisis terhadap data transaksi dan aset merchant.\nc. Hasil analisis akan menentukan batas pinjaman dan rekomendasi persetujuan.\n",
              ),
              textWidget(
                "3. Pencairan & Pembayaran",
                isHead: true,
              ),
              textWidget(
                "a. Jika disetujui, dana akan dicairkan ke rekening merchant dalam 1-3 hari kerja.\nb. Merchant wajib melakukan pembayaran sesuai tenor yang dipilih.\nc. Keterlambatan pembayaran akan dikenakan denda sesuai ketentuan yang berlaku.\n",
              ),
              textWidget(
                "4. Ketentuan Lain",
                isHead: true,
              ),
              textWidget(
                "a. Bank Mandiri berhak mengubah syarat & ketentuan sewaktu-waktu dengan pemberitahuan sebelumnya.\nb. Dengan mencentang kotak persetujuan, Merchant menyatakan telah membaca dan menyetujui seluruh ketentuan ini.\n",
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Checkbox(
                    value: controller.sk.value,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    splashRadius: 0,
                    visualDensity: VisualDensity.compact,
                    onChanged: (e) {
                      if (e == null) {
                        return;
                      }
                      controller.sk.value = e;
                    },
                  ),
                  SizedBox(width: 4.w),
                  Flexible(
                    child: RichText(
                      text: TextSpan(
                        text: "Saya telah membaca dan menyetujui ",
                        style: body5TextStyle(),
                        children: [
                          TextSpan(
                            text: "Syarat & Ketentuan ",
                            style: body5BTextStyle(
                              color: ColorConstants.primary[500],
                            ),
                          ),
                          TextSpan(
                            text: "berikut",
                            style: body5TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              AppButton(
                onPressed: controller.sk.value
                    ? () {
                        Get.toNamed(AppRoute.loanDoccument);
                      }
                    : null,
                text: "Selanjutnya",
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget(
    String text, {
    bool isHead = false,
    bool enter = false,
  }) {
    return Text(
      "$text${enter ? "\n" : ""}",
      style: body5TextStyle(
        weight: isHead ? FontWeight.bold : FontWeight.normal,
        height: 1.5,
      ),
    );
  }
}
