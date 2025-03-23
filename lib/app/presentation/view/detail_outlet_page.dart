import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/detail_outlet_controller.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/presentation/partials/outlet/card_merchant.dart';
import 'package:mobile/app/presentation/partials/outlet/card_store.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/card_common.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/routes/app_route.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:mobile/utils/get_id.dart';
import 'package:mobile/utils/img.dart';

class DetailOutletPage extends GetView<DetailOutletController> {
  const DetailOutletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Detail Outlet",
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              controller.data.value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.w),
                      child: Image.network(
                        img(controller.data.value!.image),
                        height: 150.h,
                        width: 1.sw,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(),
              SizedBox(height: 10.h),
              controller.data.value == null
                  ? Container()
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CardStore(data: controller.data.value!),
                        SizedBox(height: 10.h),
                        CardCommon(
                          title: "Status Ketersediaan Undangan Event",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${controller.data.value!.eventOpen ? "" : "Tidak "}Menerima undangan event",
                                style: body5BTextStyle(
                                  color: controller.data.value!.eventOpen
                                      ? Colors.green
                                      : Color(0xffDF3E60),
                                  weight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Switch(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.zero,
                                value: controller.data.value!.eventOpen,
                                onChanged: controller.handleToggleEvent,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GlobalController.i.merchant.value != null
                            ? CardMerchant(
                                data: GlobalController.i.merchant.value!)
                            : Container(),
                      ],
                    ),
              Expanded(child: Container()),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                        onPressed: () {
                          Get.toNamed(AppRoute.editOutlet(getId()));
                        },
                        text: "Edit"),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: AppButton(
                      onPressed: controller.delete,
                      text: "Hapus",
                      variant: AppButtonVariant.secondary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
