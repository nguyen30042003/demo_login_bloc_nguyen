

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/models/notify_request.dart';
import 'package:login/data_app/models/notify_response.dart';
import 'package:login/data_app/repository/notify_repository.dart';

import 'notify_all_item_event.dart';
import 'notify_all_item_state.dart';


class NotifyAllItemBloc extends Bloc<NotifyAllItemEvent, NotifyAllItemState>{
  final NotifyRepository _notifyRepository;

  NotifyAllItemBloc(this._notifyRepository) : super(const NotifyAllItemIntial()){
    on<FetchDataEvent>((event, state) async {
      emit(const NotifyAllItemLoading());
      try{
        NotifyRequest notifyRequest = NotifyRequest(fromDate: event.notifyRequest.fromDate, toDate: event.notifyRequest.toDate,
            langID: event.notifyRequest.langID, pageSize: event.notifyRequest.pageSize, pageIndex: event.notifyRequest.pageIndex, type: event.notifyRequest.type);

        NotifyResponse? notifyResponse = await _notifyRepository.fetchNotifyData(notifyRequest: notifyRequest);

        if(notifyResponse!.data.isNotEmpty){
          emit(NotifyAllItemLoaded(dataItemNotify: notifyResponse!.data));
        }
        else{
          emit(const NotifyAllItemLoaded(dataItemNotify: []));
        }
      }catch(e){
        emit(const NotifyAllItemErrorState(error: "Error processing loading data"));
      }
    });

    on<UpdateSeenEvent>((event, state) async{
      emit(const NotifyAllItemLoading());
      bool? check = await _notifyRepository.updateSeenNotify(readNotifyRequest: event.readNotifyRequest);
      emit(UpdateNotifySeen(index: event.index));
    });
  }
}