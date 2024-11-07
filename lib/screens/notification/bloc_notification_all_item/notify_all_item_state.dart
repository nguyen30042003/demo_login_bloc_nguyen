

import 'package:equatable/equatable.dart';
import 'package:login/data_app/models/notify_response.dart';

class NotifyAllItemState extends Equatable {
  const NotifyAllItemState();

  @override
  List<Object> get props => [];
}
class NotifyAllItemIntial extends NotifyAllItemState{
  const NotifyAllItemIntial();
}
class NotifyAllItemLoading extends NotifyAllItemState{
  const NotifyAllItemLoading();
}

class NotifyAllItemLoaded extends NotifyAllItemState{
  final List<DataItemNotify> dataItemNotify;
  const NotifyAllItemLoaded({required this.dataItemNotify});

  @override
  List<Object> get props => [dataItemNotify];
}

class UpdateNotifySeen extends NotifyAllItemState {
  final int index;

  const UpdateNotifySeen({required this.index});

  @override
  List<Object> get props => [index];
}

class NotifyAllItemErrorState extends NotifyAllItemState {
  final String error;

  const NotifyAllItemErrorState({required this.error});

  @override
  List<Object> get props => [error];
}