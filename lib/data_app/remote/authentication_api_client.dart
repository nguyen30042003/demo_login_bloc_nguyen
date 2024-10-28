import 'dart:convert';

import 'package:login/data_app/models/authentication_request.dart';
import 'package:login/data_app/remote/api_service.dart';
import 'package:login/data_app/url_api/log_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/authentication_response.dart';

class AuthenticationApiClient {
  final ApiService apiService = ApiService();
  final LogUrl logUrl = LogUrl();

  Future<AuthenticationResponse> authentication(AuthenticationRequest authenticationRequest) async {
    final response = await apiService.sendRequest(LogUrl.AUTHENTICATION_URL, 'POST', body: authenticationRequest.toJson());
    if (response.statusCode == 200) {
      return AuthenticationResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
