import 'package:login/data_app/models/authentication_request.dart';
import 'package:login/data_app/remote/authentication_api_client.dart';

import '../models/authentication_response.dart';

class AuthenticationRepository{
  final authenticationApiClient = AuthenticationApiClient();
  Future<AuthenticationResponse> authentication(AuthenticationRequest authenticationRequest) async{
    return await authenticationApiClient.authentication(authenticationRequest);
  }
}