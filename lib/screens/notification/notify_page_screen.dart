import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/models/notify_request.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_bloc.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_event.dart';
import 'package:login/screens/notification/bloc_notification_all_item/notify_all_item_screen.dart';

import '../../data_app/models/notify_type.dart';
import '../../data_app/repository/notify_repository.dart';

class NotifyPageScreen extends StatelessWidget {
  final NotifyType type;
  const NotifyPageScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    NotifyRequest notifyRequest = NotifyRequest(fromDate:  "11/01/2023", toDate:  "11/04/2024", langID: "vi", pageSize: 10, pageIndex: 0, type: type == NotifyType.All ? "" : type.name);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotifyAllItemBloc>(
          create: (_) =>
          NotifyAllItemBloc(NotifyRepository())
            ..add(FetchDataEvent(notifyRequest: notifyRequest)),
        ),
      ],
      child: NotifyAllItemScreen(notifyType: type, notifyRequest: notifyRequest,),
    );
  }
}
