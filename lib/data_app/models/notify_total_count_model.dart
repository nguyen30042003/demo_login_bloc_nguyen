

import 'package:json_annotation/json_annotation.dart';

part 'notify_total_count_model.g.dart';

@JsonSerializable()
class NotifyTotalCountModel{
  int? totalAll;
  int? totalTradePromotion;
  int? totalOtherTrade;
  int? totalNote;
  int? totalOther;

  NotifyTotalCountModel({
    this.totalAll,
    this.totalTradePromotion,
    this.totalOtherTrade,
    this.totalNote,
    this.totalOther
  });

  factory NotifyTotalCountModel.fromJson(Map<String, dynamic> json) =>
      _$NotifyTotalCountModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyTotalCountModelToJson(this);

  @override
  List<Object?> get props => [
    totalAll,
    totalTradePromotion,
    totalOtherTrade,
    totalNote,
    totalOther,
  ];
}