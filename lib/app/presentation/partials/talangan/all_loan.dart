import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile/app/controller/global_controller.dart';
import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/presentation/widgets/card_loan.dart';
import 'package:mobile/styles/text_styles.dart';

class AllLoan extends StatelessWidget {
  final List<LoanModel> data;
  const AllLoan({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "All Loans",
          style: body4BTextStyle(),
        ),
        SizedBox(height: 12.h),
        ...data.map(
          (e) => CardLoan(
            data: e,
            merchant: GlobalController.i.profile.value!.merchant,
          ),
        )
      ],
    );
  }
}
