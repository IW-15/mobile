// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantVerifyModel _$MerchantVerifyModelFromJson(Map<String, dynamic> json) =>
    MerchantVerifyModel(
      creditScore: CreditScoreModel.fromJson(
          json['creditScore'] as Map<String, dynamic>),
      loanProfile: LoanProfileModel.fromJson(
          json['loanProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MerchantVerifyModelToJson(
        MerchantVerifyModel instance) =>
    <String, dynamic>{
      'loanProfile': instance.loanProfile,
      'creditScore': instance.creditScore,
    };
