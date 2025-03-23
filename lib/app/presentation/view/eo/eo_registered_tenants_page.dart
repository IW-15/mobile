import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/app/controller/eo/eo_registered_tenants_controller.dart';
import 'package:mobile/app/presentation/partials/eo_event/card_registered_tenant.dart';
import 'package:mobile/app/presentation/widgets/app_button.dart';
import 'package:mobile/app/presentation/widgets/app_checkbox.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/not_found.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';
import 'package:mobile/extensions/string_extension.dart';
import 'package:mobile/styles/color_constants.dart';
import 'package:mobile/styles/text_styles.dart';
import 'package:get/get.dart';

class EoRegisteredTenantsPage extends GetView<EoRegisteredTenantsController> {
  const EoRegisteredTenantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: controller.filteredTenants.isEmpty
              ? Container()
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 20.w),
                    Expanded(
                      child: AppButton(
                        color: Colors.green,
                        onPressed: controller.handleManyAccept,
                        text: "Terima",
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppButton(
                        color: ColorConstants.error,
                        onPressed: controller.handleManyReject,
                        text: "Tolak",
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
          body: TalanganScaffold(
            title: "Daftar Tenant",
            scroll: false,
            child: Column(
              children: [
                AppInput(
                  controller: TextEditingController(),
                  placeholder: "Cari Tenant",
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorConstants.slate[300],
                    size: 24.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Level rekomendasi",
                      style: body5TextStyle(),
                    ),
                    Row(
                      children: [
                        FilterChip(label: "high"),
                        SizedBox(width: 3.w),
                        FilterChip(label: "mid"),
                        SizedBox(width: 3.w),
                        FilterChip(label: "low"),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    AppCheckbox(
                      value: controller.isSelectAll.value,
                      onChange: controller.handleFilterAll,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      'Pilih semua',
                      style: body5TextStyle(),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                controller.allTenants.isEmpty
                    ? Expanded(
                        child: NotFound(
                            title: "Tidak ada data",
                            description:
                                "Belum ada tenant yang mendaftar ke event anda, silakan tunggu"),
                      )
                    : Container(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ...controller.allTenants
                          .map((tenant) => CardRegisteredTenant(
                                value: tenant.value,
                                data: tenant.data,
                                onChange: (e) {
                                  tenant.value = e;
                                  controller.allTenants.refresh();
                                },
                              ))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class FilterChip extends StatefulWidget {
  final String label;
  const FilterChip({
    super.key,
    required this.label,
  });

  @override
  State<FilterChip> createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: ColorConstants.slate[200],
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Row(
        children: [
          Text(
            widget.label.toCapitalized,
            style: body6TextStyle(weight: FontWeight.w500),
          ),
          SizedBox(width: 5.w),
          Container(
            width: 18.w,
            height: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorConstants.slate[100],
            ),
          ),
        ],
      ),
    );
  }
}
