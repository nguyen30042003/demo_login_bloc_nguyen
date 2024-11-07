import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data_app/models/notify_count_request.dart';

@immutable
abstract class NotifyEvent extends Equatable {
  const NotifyEvent();

  @override
  List<Object?> get props => [];
}

class FetchNotifyNotSeenCount extends NotifyEvent {
  final NotifyCountRequest notifyCountRequest;

  const FetchNotifyNotSeenCount({required this.notifyCountRequest});
}

class UpdateSeenNotify extends NotifyEvent {
  final String? branchId;
  final String? slsperId;
  final String? notifyID;
  final String? notifyTime;
  final String? notifyType;

  const UpdateSeenNotify({
    required this.slsperId,
    required this.branchId,
    this.notifyID,
    this.notifyTime,
    this.notifyType,
  });

  @override
  List<Object?> get props => [
    branchId,
    slsperId,
    notifyID,
    notifyTime,
    notifyType,
  ];
}
class ChangeIndexPageEvent extends NotifyEvent {
  final int? index;

  const ChangeIndexPageEvent({this.index});
}