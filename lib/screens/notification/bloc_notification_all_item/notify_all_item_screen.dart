import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:login/data_app/models/notify_type.dart';
import 'package:login/data_app/models/read_notify_request.dart';
import 'package:login/screens/notification/bloc_notification/notify_event.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_bloc.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_event.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_state.dart';
import 'package:login/screens/notification/notify_detail_screen.dart';
import 'package:login/utils/pallete.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data_app/models/notify_count_request.dart';
import '../../../data_app/models/notify_request.dart';
import '../../../data_app/models/notify_response.dart';
import '../../../widgets/notify_item.dart';
import '../bloc_notification/notify_bloc.dart';

class NotifyAllItemScreen extends StatefulWidget {
  final NotifyType notifyType;
  final NotifyRequest notifyRequest;
  const NotifyAllItemScreen({super.key, required this.notifyType, required this.notifyRequest});

  @override
  State<NotifyAllItemScreen> createState() => _NotifyAllItemScreenState();
}

class _NotifyAllItemScreenState extends State<NotifyAllItemScreen>  {
  List<DataItemNotify> _notifyItemList = [];
  late NotifyAllItemBloc _notifyAllItemBloc;
  bool _hasMoreData = true;
  late ScrollController _scrollController;
  int _pageIndex = 0;
  final int _pageSize = 10;
  String _notDataNotify = "";

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _notifyAllItemBloc = BlocProvider.of<NotifyAllItemBloc>(context);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadData() async {
    _notifyItemList = [];
    _notifyAllItemBloc.add(FetchDataEvent(notifyRequest: widget.notifyRequest));
    NotifyCountRequest notifyCountRequest = NotifyCountRequest(fromDate: "11/01/2023", toDate: "11/04/2024", langId: "vi");
    final notifyBloc = BlocProvider.of<NotifyBloc>(context);
    notifyBloc.add(FetchNotifyNotSeenCount(notifyCountRequest: notifyCountRequest));
  }

  Future<void> _loadDataScrollView() async {
    NotifyRequest updatedRequest = NotifyRequest(
      fromDate: widget.notifyRequest.fromDate,
      toDate: widget.notifyRequest.toDate,
      langID: widget.notifyRequest.langID,
      pageSize: 10,
      pageIndex: _pageIndex,
      type: widget.notifyRequest.type,
    );
    _notifyAllItemBloc.add(FetchDataEvent(notifyRequest: updatedRequest));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[_notifyItems()],
      ),
    );
  }

  Widget _notifyItems() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'move_to_top_${widget.notifyType}',
        backgroundColor: Pallete.background1Color,
        child: const Icon(Icons.arrow_upward),
        onPressed: _moveUp,
      ),
      body: BlocListener<NotifyAllItemBloc, NotifyAllItemState>(
        listener: (BuildContext context, NotifyAllItemState state) {
          if (state is NotifyAllItemErrorState) {
             Container(
              alignment: Alignment.center,
              child:  Text(state.error),
            );
          } else if (state is NotifyAllItemLoaded) {
            if (state.dataItemNotify.isNotEmpty) {
              _notDataNotify = "";
              if (_pageIndex > 0) {
                _notifyItemList.addAll(state.dataItemNotify);
              }
              else {
                _notifyItemList = state.dataItemNotify;
              }

              if(state.dataItemNotify.length < _pageSize){
                print("object");
                setState(() {
                  _hasMoreData = false;
                });
              }
            } else {
              setState(() {
                _hasMoreData = false;
              });
              if(_pageIndex == 0){
                _notDataNotify = "Không có thông báo";
              }
            }
          } else if (state is UpdateNotifySeen) {
            _notifyItemList[state.index].isRead = true;
          }
        },
        child: BlocBuilder<NotifyAllItemBloc, NotifyAllItemState>(
          builder: (context, state) {
            return RefreshIndicator(
                onRefresh: () async {
                  _pageIndex = 0;
                  _loadData();
                },
                child: _notDataNotify.isEmpty ? ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      if(index < _notifyItemList.length){
                        return _notifyItemView(_notifyItemList[index], index);
                      }
                      else{
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Center(
                            child: _hasMoreData ? const CircularProgressIndicator() : Container(),
                          ),
                        );
                      }
                    },
                    itemCount: _notifyItemList.length + 1 )
                    : Container(
                    alignment: Alignment.center,
                    child: Text(
                      _notDataNotify,
                      style: const TextStyle(
                          fontSize: 16
                      ),
                    )
                )
            );
          },
        ),
      ),
    );
  }


  Widget _notifyItemView(DataItemNotify dataItemNotify, int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, index == 0 ? 12 : 0, 12, 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        child: NotifyItem(
          dataItemNotify: dataItemNotify,
        ),
        onTap: () {
          _updateSeenNotify(dataItemNotify, index);
        },
      ),
    );
  }

  Future<void> _updateSeenNotify(DataItemNotify data, int index) async {
    final prefs = await SharedPreferences.getInstance();
    String? slsperId = prefs.getString('slsperID');
    DateTime notifyTime = DateFormat('dd/MM/yyyy HH:mm:ss').parse(data.notifyTime);
    ReadNotifyRequest readNotifyRequest = ReadNotifyRequest(
      slsperId: slsperId,
      notifyId: data.notifyID,
      notifyTime: notifyTime,
      notifyType: data.notifyType,
      branchId: "",
    );
    _notifyAllItemBloc.add(UpdateSeenEvent(readNotifyRequest: readNotifyRequest, index: index));
    _onTapNavigationToDetail(data);
  }

  Future<void> _onTapNavigationToDetail(DataItemNotify data) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotifyDetailScreen(dataItemNotify: data,)));
    _loadData();
  }

  void _moveUp() {
    _scrollController.jumpTo(
        _scrollController.offset - _scrollController.position.maxScrollExtent);
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent == _scrollController.position.pixels) {
      setState(() {
        _pageIndex++;
      });
      _loadDataScrollView();
    }
  }


}

