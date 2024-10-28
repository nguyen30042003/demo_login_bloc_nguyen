class AuthenticationRequest{
  final String username;
  final String password;
  final String imei;

  AuthenticationRequest({required this.username, required this.password, required this.imei});
  Map<String, dynamic> toJson() {
    return {
      'userName': username,
      'password': password,
      'imei': imei,
    };
  }
}