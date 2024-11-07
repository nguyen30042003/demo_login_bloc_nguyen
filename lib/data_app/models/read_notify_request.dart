


import 'package:json_annotation/json_annotation.dart';

import 'package:intl/intl.dart';

class ReadNotifyRequest {
  String? branchId;
  String? slsperId;
  String? notifyId;
  DateTime? notifyTime; // Change this to DateTime for easier formatting
  String? notifyType;

  ReadNotifyRequest({
    required this.branchId,
    required this.slsperId,
    required this.notifyId,
    required this.notifyTime,
    required this.notifyType,
  });

  Map<String, dynamic> toJson() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return {
      'branchID': branchId,
      'slsperID': slsperId,
      'notifyID': notifyId,
      'notifyTime': formatter.format(notifyTime!), // Format here
      'notifyType': notifyType,
    };
  }
}
