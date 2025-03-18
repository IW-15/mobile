import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel extends BaseModel implements ModelFactory {
  final int id;
  final String name;
  final String type;
  final int amount;
  final DateTime date;

  const TransactionModel({
    required this.amount,
    required this.date,
    required this.id,
    required this.name,
    required this.type,
    required super.created_at,
    required super.updated_at,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
