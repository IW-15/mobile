import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'credit_score_model.g.dart';

@JsonSerializable()
class CreditScoreModel extends BaseModel implements ModelFactory {
  final int score;
  final String indicator;
  final int id;

  const CreditScoreModel({
    required this.id,
    required this.indicator,
    required this.score,
    required super.created_at,
    required super.updated_at,
  });

  factory CreditScoreModel.fromJson(Map<String, dynamic> json) =>
      _$CreditScoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$CreditScoreModelToJson(this);
}
