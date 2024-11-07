import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/repository/notify_repository.dart';
import 'package:login/screens/notification/bloc_notification/notify_event.dart';
import 'package:login/screens/notification/bloc_notification/notify_state.dart';

import '../../../data_app/models/notify_total_count_model.dart';

class NotifyBloc extends Bloc<NotifyEvent, NotifyState> {
  final NotifyRepository _notifyRepository;

  NotifyBloc(this._notifyRepository) : super(NotifyStateInitial()) {
    on<FetchNotifyNotSeenCount>((event, emit) async {
      emit(NotifyStateLoading());
      try {
        NotifyTotalCountModel? notifyTotalCountModel =
        await _notifyRepository.fetchNotifyTotalCount(
            fromDate: event.notifyCountRequest.fromDate,
            toDate: event.notifyCountRequest.toDate,
            langId: event.notifyCountRequest.langId);
        if (notifyTotalCountModel != null) {
          emit(TotalNotificationLoaded(
            totalUnread: notifyTotalCountModel.totalAll ?? 0,
            tradePromotionUnRead: notifyTotalCountModel.totalTradePromotion ?? 0,
            otherTradeUnRead: notifyTotalCountModel.totalOtherTrade ?? 0,
            noteUnRead: notifyTotalCountModel.totalNote ?? 0,
            otherUnRead: notifyTotalCountModel.totalOther ?? 0
          ));
        }
      } catch (e) {
        emit(const NotifyErrorState(error: 'Error processing loading data'));
      }
    });

    on<ChangeIndexPageEvent>((event, emit) async {
      emit(ChangeIndexPageState(event.index!));
    });
  }
}
