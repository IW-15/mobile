import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/transaction/transaction_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'cashflow_model.g.dart';

@JsonSerializable()
class CashflowModel implements ModelFactory {
  final int income;
  final int outcome;
  final List<TransactionModel> history;

  const CashflowModel({
    required this.history,
    required this.income,
    required this.outcome,
  });

  factory CashflowModel.fromJson(Map<String, dynamic> json) =>
      _$CashflowModelFromJson(json);
  Map<String, dynamic> toJson() => _$CashflowModelToJson(this);
}
