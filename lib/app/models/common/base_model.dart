import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel implements ModelFactory {
  final DateTime? created_at;
  final DateTime? updated_at;

  const BaseModel({
    required this.created_at,
    required this.updated_at,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);
}
