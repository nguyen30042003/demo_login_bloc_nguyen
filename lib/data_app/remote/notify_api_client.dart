

import 'dart:convert';

import 'package:login/data_app/models/notify_request.dart';
import 'package:login/data_app/models/read_notify_request.dart';

import '../models/notify_response.dart';
import '../models/notify_total_count_model.dart';
import '../url_api/notify_url.dart';
import 'api_service.dart';

class NotifyApiClient{
  final ApiService apiService = ApiService();

  Future<NotifyTotalCountModel?>fetchNotifyTotalCount({
    required String fromDate,
    required String toDate,
    required String langId,
  }) async {
    var fromDate0 = '?fromDate=$fromDate';
    var toDate0 = '&toDate=$toDate';
    var langId0 = '&langID=$langId';
    final url = '${NotifyUrl.FETCH_NOTIFY_COUNT}$fromDate0$toDate0$langId0';
    final response = await apiService.sendRequest(url, 'GET');
    if (response.statusCode == 200) {
      return NotifyTotalCountModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<NotifyResponse?> fetchNotifyData({required NotifyRequest notifyRequest}) async {
    var _fromDate = '?fromDate=${notifyRequest.fromDate}';
    var _toDate = '&toDate=${notifyRequest.toDate}';
    var _langId = '&langID=${notifyRequest.langID}';
    var _pageIndex = '&pageIndex=${notifyRequest.pageIndex}';
    var _pageSize = '&pageSize=${notifyRequest.pageSize}';
    var _type = notifyRequest.type.isNotEmpty ? '&type=${notifyRequest.type}' : '';
    final url = '${NotifyUrl.FETCH_NOTIFY}$_fromDate$_toDate$_langId$_pageIndex$_pageSize$_type';
    final response = await apiService.sendRequest(url, 'GET');
    if (response.statusCode == 200) {
      return NotifyResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load notification');
    }
  }

  Future<bool> updateReadNotify({required ReadNotifyRequest readNotifyRequest}) async {
    const url = NotifyUrl.READ_NOTIFY_BY_ID;
    final response = await apiService.sendRequest(url, 'POST', body: readNotifyRequest.toJson());
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update read a notification');
    }

  }
}