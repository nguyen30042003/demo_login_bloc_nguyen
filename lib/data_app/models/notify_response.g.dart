// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyResponse _$NotifyResponseFromJson(Map<String, dynamic> json) =>
    NotifyResponse(
      total: (json['total'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => DataItemNotify.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NotifyResponseToJson(NotifyResponse instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataItemNotify _$DataItemNotifyFromJson(Map<String, dynamic> json) =>
    DataItemNotify(
      notifyID: json['notifyID'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      notifyTime: json['notifyTime'] as String,
      fileType: json['fileType'] as String,
      fileUrl: json['fileUrl'] as String,
      notifyType: json['notifyType'] as String,
      fileModifiedDate: json['fileModifiedDate'] as String,
      viewDate: json['viewDate'] as String,
      isRead: json['isRead'] as bool,
      isSync: json['isSync'] as bool,
      fromdate: json['fromdate'] as String,
      toDate: json['toDate'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$DataItemNotifyToJson(DataItemNotify instance) =>
    <String, dynamic>{
      'notifyID': instance.notifyID,
      'title': instance.title,
      'content': instance.content,
      'notifyTime': instance.notifyTime,
      'fileType': instance.fileType,
      'fileUrl': instance.fileUrl,
      'notifyType': instance.notifyType,
      'fileModifiedDate': instance.fileModifiedDate,
      'viewDate': instance.viewDate,
      'isRead': instance.isRead,
      'isSync': instance.isSync,
      'fromdate': instance.fromdate,
      'toDate': instance.toDate,
      'code': instance.code,
    };
