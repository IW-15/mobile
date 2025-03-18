import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel implements ModelFactory {
  final int id;
  final String email;
  final String phone;
  final String fullName;
  final String firstName;
  final String lastName;

  const UserModel({
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.id,
    required this.lastName,
    required this.phone,
    required super.created_at,
    required super.updated_at,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
