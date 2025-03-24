import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile/app/controller/sme/invitation_controller.dart';
import 'package:mobile/app/presentation/partials/event/card_invitation.dart';
import 'package:mobile/app/presentation/widgets/app_dropdown.dart';
import 'package:mobile/app/presentation/widgets/app_input.dart';
import 'package:mobile/app/presentation/widgets/not_found.dart';
import 'package:mobile/app/presentation/widgets/talangan_scaffold.dart';

class InvitationPage extends GetView<InvitationController> {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TalanganScaffold(
        title: "Undangan Events",
        child: Obx(
          () => Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppInput(
                      controller: TextEditingController(),
                      placeholder: "Cari",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 11.w),
                  Expanded(
                    child: AppDropdown(
                      placeholder: "Status",
                      items: [
                        AppDropdownItem(text: "Ditolak", value: "rejected"),
                        AppDropdownItem(text: "Menunggu", value: "pending"),
                        AppDropdownItem(text: "Diterima", value: "accepted"),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              controller.invitations.isEmpty
                  ? NotFound(
                      title: "Tidak ada undangan",
                      description:
                          "Tidak ada undangan event yang masuk. Silakan hubungi EO yang tersedia",
                    )
                  : Container(),
              ...controller.invitations.map(
                (e) => CardInvitation(data: e),
              )
            ],
          ),
        ),
      ),
    );
  }
}
