import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/eo/eo_model.dart';
import 'package:mobile/app/models/merchant/merchant_model.dart';
import 'package:mobile/app/models/user/user_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'eo_profile_model.g.dart';

@JsonSerializable()
class EoProfileModel implements ModelFactory {
  final UserModel user;
  final EoModel eo;

  const EoProfileModel({
    required this.eo,
    required this.user,
  });

  factory EoProfileModel.fromJson(Map<String, dynamic> json) =>
      _$EoProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$EoProfileModelToJson(this);
}
