import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile/app/controller/eo/eo_event_map_controller.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/convert_coordinate.dart';

class EoEventMapPage extends GetView<EoEventMapController> {
  const EoEventMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Positioned.fill(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    controller.position.value.latitude,
                    controller.position.value.longitude,
                  ),
                  zoom: 14.476,
                ),
                onMapCreated: (GoogleMapController controller) {},
                onCameraMove: controller.onCameraMove,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: Colors.white,
                  boxShadow: [
                    ColorConstants.shadow[1]!,
                  ],
                ),
                child: Icon(
                  Icons.location_on,
                  color: ColorConstants.primary[500],
                  size: 24.sp,
                ),
              ),
            ),
            Positioned(
              top: 60.w,
              left: 20.w,
              right: 20.w,
              child: AppInput(
                controller: TextEditingController(),
                placeholder: "Cari Lokasi",
                suffixIcon: Icon(
                  Icons.search,
                  size: 24.w,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.w),
                    topRight: Radius.circular(30.w),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Align(
                      child: Container(
                        width: 30.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: ColorConstants.primary[300],
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      convertCoordinate(
                        controller.position.value.latitude,
                        controller.position.value.longitude,
                      ),
                      textAlign: TextAlign.start,
                      style: body3BTextStyle(
                        color: ColorConstants.primary[00],
                      ),
                    ),
                    SizedBox(height: 13.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: ColorConstants.primary[1],
                        ),
                        SizedBox(width: 8.w),
                        Flexible(
                          child: Text(
                            controller.location.value,
                            style: body4TextStyle(
                              color: ColorConstants.slate[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(.3),
                      height: 28.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: SizedBox(
                        child: AppButton(
                          width: 1.sw,
                          onPressed: controller.onSave,
                          text: "Simpan",
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
