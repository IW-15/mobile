import 'package:mobile/app/models/cashflow/cashflow_model.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/models/eo/eo_model.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/event/event_response.dart';
import 'package:mobile/app/models/event_invitation/event_invitation_model.dart';
import 'package:mobile/app/models/event_registered/event_registered_model.dart';
import 'package:mobile/app/models/loan/loan_model.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/merchant_verify/merchant_verify_model.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/models/outlet_revenue/outlet_revenue_model.dart';
import 'package:mobile/app/models/profile/eo_profile_model.dart';
import 'package:mobile/app/models/profile/profile_model.dart';
import 'package:mobile/app/models/repayment/repayment_model.dart';
import 'package:mobile/app/models/transaction/transaction_model.dart';
import 'package:mobile/app/models/user/user_model.dart';

abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");

    if (strType == (BaseModel).toString()) {
      return BaseModel.fromJson(json);
    } else if (strType == (UserModel).toString()) {
      return UserModel.fromJson(json);
    } else if (strType == (MerchantModel).toString()) {
      return MerchantModel.fromJson(json);
    } else if (strType == (ProfileModel).toString()) {
      return ProfileModel.fromJson(json);
    } else if (strType == (TransactionModel).toString()) {
      return TransactionModel.fromJson(json);
    } else if (strType == (CashflowModel).toString()) {
      return CashflowModel.fromJson(json);
    } else if (strType == (OutletModel).toString()) {
      return OutletModel.fromJson(json);
    } else if (strType == (OutletRevenueModel).toString()) {
      return OutletRevenueModel.fromJson(json);
    } else if (strType == (RepaymentModel).toString()) {
      return RepaymentModel.fromJson(json);
    } else if (strType == (LoanProfileModel).toString()) {
      return LoanProfileModel.fromJson(json);
    } else if (strType == (LoanModel).toString()) {
      return LoanModel.fromJson(json);
    } else if (strType == (CreditScoreModel).toString()) {
      return CreditScoreModel.fromJson(json);
    } else if (strType == (MerchantVerifyModel).toString()) {
      return MerchantVerifyModel.fromJson(json);
    } else if (strType == (EoModel).toString()) {
      return EoModel.fromJson(json);
    } else if (strType == (EoProfileModel).toString()) {
      return EoProfileModel.fromJson(json);
    } else if (strType == (EventModel).toString()) {
      return EventModel.fromJson(json);
    } else if (strType == (EventsResponse).toString()) {
      return EventsResponse.fromJson(json);
    } else if (strType == (EventRegisteredModel).toString()) {
      return EventRegisteredModel.fromJson(json);
    } else if (strType == (EventInvitationModel).toString()) {
      return EventInvitationModel.fromJson(json);
    }

    throw UnimplementedError();
  }
}
