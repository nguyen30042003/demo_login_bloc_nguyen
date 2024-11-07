import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/data_app/models/notify_response.dart';
import 'package:login/data_app/models/notify_type.dart';
import 'package:login/utils/pallete.dart';

class NotifyDetailScreen extends StatelessWidget {
  final DataItemNotify dataItemNotify;
  const NotifyDetailScreen({super.key, required this.dataItemNotify});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Notify Detail'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          dataItemNotify.title
        ),
      ),
    );
  }
}
