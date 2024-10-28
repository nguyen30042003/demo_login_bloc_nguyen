

import 'package:login/data_app/models/user_information.dart';
import 'package:login/data_app/remote/user_api_client.dart';

class UserRepository{
  final userApiClient = UserApiClient();
  Future<UserInformation> fetchUserInformation() async{
    return await userApiClient.getUserInformation();
  }
}