import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/eo/eo_available_tenants_controller.dart';
import 'package:mobile/app/presentation/partials/eo_event/card_available_tenant.dart';
import 'package:mobile/app/presentation/widgets/app_bottombar.dart';
import 'package:mobile/app/presentation/widgets/not_found.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';

class EoAvailableTenantsPage extends GetView<EoAvailableTenantsController> {
  const EoAvailableTenantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        isSme: false,
        route: AppRoute.eoAvailableTenants(":id"),
      ),
      body: TalanganScaffold(
        title: "Cari Tenants",
        action: Icon(
          Icons.inbox,
          color: ColorConstants.primary[500],
          size: 24.w,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorConstants.primary[500],
                          size: 20.w,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Lokasi Anda',
                          style: body5TextStyle(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Surabaya",
                          style: body5BTextStyle(
                            color: ColorConstants.primary[500],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              headerSection("Tenant Sebelumnya"),
              SizedBox(height: 14.h),
              controller.outlets.isEmpty
                  ? NotFound(
                      title: "Tidak ada data",
                      description: "Tidak ada data tenants yang tersedia")
                  : Container(),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.outlets
                      .map((e) => CardAvailableTenant(data: e))
                      .toList(),
                ),
              ),
              SizedBox(height: 20.h),
              headerSection("Kategori Relevan"),
              controller.outlets.isEmpty
                  ? NotFound(
                      title: "Tidak ada data",
                      description: "Tidak ada data tenants yang tersedia")
                  : Container(),
              SizedBox(height: 14.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.outlets
                      .map((e) => CardAvailableTenant(data: e))
                      .toList(),
                ),
              ),
              SizedBox(height: 20.h),
              headerSection("Usaha Terdekat"),
              controller.outlets.isEmpty
                  ? NotFound(
                      title: "Tidak ada data",
                      description: "Tidak ada data tenants yang tersedia")
                  : Container(),
              SizedBox(height: 14.h),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.outlets
                      .map((e) => CardAvailableTenant(data: e))
                      .toList(),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerSection(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: h5BTextStyle(),
        ),
        Row(
          children: [
            Text(
              "Lihat Semua",
              style: body6TextStyle(
                weight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              child: Icon(
                Icons.chevron_right,
                size: 16.w,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
