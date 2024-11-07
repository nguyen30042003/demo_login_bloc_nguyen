

import 'package:equatable/equatable.dart';

class NotifyState extends Equatable {
  const NotifyState();

  @override
  List<Object> get props => [];
}
class NotifyStateInitial extends NotifyState {}

class NotifyStateLoading extends NotifyState {}

class ChangeIndexPageState extends NotifyState {
  final int index;

  const ChangeIndexPageState(this.index);

  @override
  List<Object> get props => [index];
}


class TotalNotificationLoaded extends NotifyState {
  final int? totalUnread;
  final int? tradePromotionUnRead;
  final int? otherTradeUnRead;
  final int? noteUnRead;
  final int? otherUnRead;

  const TotalNotificationLoaded({
    this.totalUnread,
    this.tradePromotionUnRead,
    this.otherTradeUnRead,
    this.noteUnRead,
    this.otherUnRead,
  });

  @override
  List<Object> get props => [
    totalUnread ?? 0,
    tradePromotionUnRead ?? 0,
    otherTradeUnRead ?? 0,
    noteUnRead ?? 0,
    otherUnRead ?? 0
  ];
}

class NotifyErrorState extends NotifyState {
  final String error;

  const NotifyErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
