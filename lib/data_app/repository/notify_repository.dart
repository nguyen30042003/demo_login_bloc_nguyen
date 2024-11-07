import 'package:login/data_app/models/notify_request.dart';
import 'package:login/data_app/models/read_notify_request.dart';
import 'package:login/data_app/remote/notify_api_client.dart';

import '../models/notify_response.dart';
import '../models/notify_total_count_model.dart';

class NotifyRepository{
  final notifyApiClient = NotifyApiClient();
  Future<NotifyTotalCountModel?>fetchNotifyTotalCount({
    required String fromDate,
    required String toDate,
    required String langId,
  }) async{
    return await notifyApiClient.fetchNotifyTotalCount(fromDate: fromDate, toDate: toDate, langId: langId);
  }

  Future<NotifyResponse?> fetchNotifyData({required NotifyRequest notifyRequest}) async {
    return await notifyApiClient.fetchNotifyData(notifyRequest: notifyRequest);
  }

  Future<bool?> updateSeenNotify({required ReadNotifyRequest readNotifyRequest}) async {
    return await notifyApiClient.updateReadNotify(readNotifyRequest: readNotifyRequest);
  }
}