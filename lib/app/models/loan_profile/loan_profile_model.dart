import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'loan_profile_model.g.dart';

@JsonSerializable()
class LoanProfileModel extends BaseModel implements ModelFactory {
  final int minAmount;
  final int limit;
  final int maxAmount;
  final int id;

  const LoanProfileModel({
    required this.id,
    required this.limit,
    required this.maxAmount,
    required this.minAmount,
    required super.created_at,
    required super.updated_at,
  });

  factory LoanProfileModel.fromJson(Map<String, dynamic> json) =>
      _$LoanProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoanProfileModelToJson(this);
}
