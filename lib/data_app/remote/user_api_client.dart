import 'dart:convert';

import 'package:login/data_app/models/user_information.dart';
import 'package:login/data_app/url_api/user_url.dart';

import 'api_service.dart';

class UserApiClient{
  final ApiService apiService = ApiService();

  Future<UserInformation> getUserInformation() async {
    final response = await apiService.sendRequest(UserUrl.USER_INFORMATION_URL, 'GET');
    print(response.statusCode);
    if (response.statusCode == 200) {
      return UserInformation.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}