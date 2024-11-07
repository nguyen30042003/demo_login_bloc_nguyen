// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_total_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyTotalCountModel _$NotifyTotalCountModelFromJson(
        Map<String, dynamic> json) =>
    NotifyTotalCountModel(
      totalAll: (json['totalAll'] as num?)?.toInt(),
      totalTradePromotion: (json['totalTradePromotion'] as num?)?.toInt(),
      totalOtherTrade: (json['totalOtherTrade'] as num?)?.toInt(),
      totalNote: (json['totalNote'] as num?)?.toInt(),
      totalOther: (json['totalOther'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotifyTotalCountModelToJson(
        NotifyTotalCountModel instance) =>
    <String, dynamic>{
      'totalAll': instance.totalAll,
      'totalTradePromotion': instance.totalTradePromotion,
      'totalOtherTrade': instance.totalOtherTrade,
      'totalNote': instance.totalNote,
      'totalOther': instance.totalOther,
    };
