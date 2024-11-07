import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notify_response.g.dart';

@JsonSerializable()
class NotifyResponse extends Equatable {
  final int total;
  final List<DataItemNotify> data;

  const NotifyResponse({required this.total, required this.data});

  factory NotifyResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifyResponseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [total, data];
}

@JsonSerializable()
class DataItemNotify extends Equatable{
  String notifyID;
  String title;
  String content;
  String notifyTime;
  String fileType;
  String fileUrl;
  String notifyType;
  String fileModifiedDate;
  String viewDate;
  bool isRead;
  bool isSync;
  String fromdate;
  String toDate;
  String code;

  DataItemNotify({
    required this.notifyID,
    required this.title,
    required this.content,
    required this.notifyTime,
    required this.fileType,
    required this.fileUrl,
    required this.notifyType,
    required this.fileModifiedDate,
    required this.viewDate,
    required this.isRead,
    required this.isSync,
    required this.fromdate,
    required this.toDate,
    required this.code,
  });

  factory DataItemNotify.fromJson(Map<String, dynamic> json) => _$DataItemNotifyFromJson(json);

  Map<String, dynamic> toJson() => _$DataItemNotifyToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
   notifyID,
   title,
   content,
   notifyTime,
   fileType,
   fileUrl,
   notifyType,
   fileModifiedDate,
   viewDate,
   isRead,
   isSync,
   fromdate,
   toDate,
   code
  ];
}
