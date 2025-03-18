import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/credit_score/credit_score_model.dart';
import 'package:mobile/app/models/loan_profile/loan_profile_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'merchant_verify_model.g.dart';

@JsonSerializable()
class MerchantVerifyModel implements ModelFactory {
  final LoanProfileModel loanProfile;
  final CreditScoreModel creditScore;

  const MerchantVerifyModel({
    required this.creditScore,
    required this.loanProfile,
  });

  factory MerchantVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantVerifyModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantVerifyModelToJson(this);
}
