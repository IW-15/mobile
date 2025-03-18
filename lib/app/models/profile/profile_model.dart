import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/user/user_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel implements ModelFactory {
  final UserModel user;
  final MerchantModel merchant;

  const ProfileModel({
    required this.merchant,
    required this.user,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
