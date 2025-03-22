import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'eo_model.g.dart';

@JsonSerializable()
class EoModel extends BaseModel implements ModelFactory {
  final int id;
  final int id_user;
  final String name;
  final String nib;
  final String pic;
  final String picPhone;
  final String email;
  final String address;
  final String document;

  const EoModel({
    required this.address,
    required this.document,
    required this.email,
    required this.id,
    required this.id_user,
    required this.name,
    required this.nib,
    required this.pic,
    required this.picPhone,
    required super.created_at,
    required super.updated_at,
  });

  factory EoModel.fromJson(Map<String, dynamic> json) =>
      _$EoModelFromJson(json);
  Map<String, dynamic> toJson() => _$EoModelToJson(this);
}
