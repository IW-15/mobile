import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'merchant_model.g.dart';

@JsonSerializable()
class MerchantModel extends BaseModel implements ModelFactory {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String? applyForm;
  final String? ktp;
  final String? photo;
  final String? license;
  final String? npwp;

  const MerchantModel({
    required this.address,
    required this.applyForm,
    required this.email,
    required this.id,
    required this.ktp,
    required this.license,
    required this.name,
    required this.npwp,
    required this.phone,
    required this.photo,
    required super.created_at,
    required super.updated_at,
  });

  factory MerchantModel.fromJson(Map<String, dynamic> json) =>
      _$MerchantModelFromJson(json);
  Map<String, dynamic> toJson() => _$MerchantModelToJson(this);
}
