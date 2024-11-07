import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/notification/bloc_notification/notify_screen.dart';

import '../../data_app/models/notify_count_request.dart';
import '../../data_app/repository/notify_repository.dart';
import 'bloc_notification/notify_bloc.dart';
import 'bloc_notification/notify_event.dart';

class NotifyMainScreen extends StatelessWidget {
  const NotifyMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotifyCountRequest notifyCountRequest = NotifyCountRequest(fromDate: "11/01/2023", toDate: "11/04/2024", langId: "vi");
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotifyBloc>(
          create: (_) =>
          NotifyBloc(NotifyRepository())
            ..add(FetchNotifyNotSeenCount(notifyCountRequest: notifyCountRequest)),
        ),
      ],
      child: const NotifyScreen(),
    );
  }
}
