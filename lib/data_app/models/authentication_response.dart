class AuthenticationResponse {
  final String accessToken;
  final dynamic checkInBranchData;
  final DataLoginLate? dataLoginLate;
  final bool isChangePassword;

  AuthenticationResponse({
    required this.accessToken,
    this.checkInBranchData,
    this.dataLoginLate,
    required this.isChangePassword,
  });

  // fromJson method
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    return AuthenticationResponse(
      accessToken: json['access_token'],
      checkInBranchData: json['checkInBranchData'],
      dataLoginLate: json['dataLoginLate'] != null
          ? DataLoginLate.fromJson(json['dataLoginLate'])
          : null,
      isChangePassword: json['isChangePassword'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'checkInBranchData': checkInBranchData,
      'dataLoginLate': dataLoginLate?.toJson(),
      'isChangePassword': isChangePassword,
    };
  }
}

class DataLoginLate {
  final String visitTime;
  final String? lateTime;
  final String policyTime;

  DataLoginLate({
    required this.visitTime,
    this.lateTime,
    required this.policyTime,
  });

  // fromJson method
  factory DataLoginLate.fromJson(Map<String, dynamic> json) {
    return DataLoginLate(
      visitTime: json['visitTime'],
      lateTime: json['lateTime'],
      policyTime: json['policyTime'],
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'visitTime': visitTime,
      'lateTime': lateTime,
      'policyTime': policyTime,
    };
  }
}
