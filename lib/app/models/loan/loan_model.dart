import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'loan_model.g.dart';

@JsonSerializable()
class LoanModel extends BaseModel implements ModelFactory {
  final int id;
  final int amount;
  final int tenor;
  final int monthlyBill;
  final DateTime applicationDate;
  final String status;
  // "repayment": [

  const LoanModel({
    required this.amount,
    required this.applicationDate,
    required this.id,
    required this.monthlyBill,
    required this.status,
    required this.tenor,
    required super.created_at,
    required super.updated_at,
  });

  factory LoanModel.fromJson(Map<String, dynamic> json) =>
      _$LoanModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoanModelToJson(this);
}
