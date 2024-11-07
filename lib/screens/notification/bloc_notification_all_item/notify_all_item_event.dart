

import 'package:equatable/equatable.dart';
import 'package:login/data_app/models/notify_request.dart';
import 'package:login/data_app/models/read_notify_request.dart';

abstract class NotifyAllItemEvent extends Equatable{

  const NotifyAllItemEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchDataEvent extends NotifyAllItemEvent{
  final NotifyRequest notifyRequest;
  const FetchDataEvent({required this.notifyRequest});
  @override
  // TODO: implement props
  List<Object?> get props => [notifyRequest];
}

class UpdateSeenEvent extends NotifyAllItemEvent {
  final ReadNotifyRequest readNotifyRequest;
  final int index;

  const UpdateSeenEvent({required this.readNotifyRequest, required this.index});

  @override
  // TODO: implement props
  List<Object?> get props => [readNotifyRequest, index];

}
