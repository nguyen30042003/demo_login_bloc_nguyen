import 'package:login/data_app/url_api/root_url.dart';

const String ROOT_API_NOTIFY_URL = '$ROOT_API_CATALOGS_URL/api/Notification';

class NotifyUrl {

  static const String FETCH_NOTIFY = '$ROOT_API_NOTIFY_URL/FetchNotification';

  static const String FETCH_NOTIFY_COUNT = '$ROOT_API_NOTIFY_URL/FetchCountNotification';

  static const String READ_NOTIFY_BY_ID = '$ROOT_API_NOTIFY_URL/ReadNotification';
}