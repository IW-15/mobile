import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'repayment_model.g.dart';

@JsonSerializable()
class RepaymentModel extends BaseModel implements ModelFactory {
  final int id;
  final DateTime date;
  final int order;
  final int amount;

  const RepaymentModel({
    required this.amount,
    required this.date,
    required this.id,
    required this.order,
    required super.created_at,
    required super.updated_at,
  });

  factory RepaymentModel.fromJson(Map<String, dynamic> json) =>
      _$RepaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$RepaymentModelToJson(this);
}
