import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final String accessToken;
  final dynamic checkInBranchData;
  final DataLoginLate? dataLoginLate;
  final bool isChangePassword;

  LoginResponse({
    required this.accessToken,
    this.checkInBranchData,
    this.dataLoginLate,
    required this.isChangePassword,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  @override
  List<Object?> get props => [
    accessToken,
    checkInBranchData,
    dataLoginLate,
    isChangePassword,
  ];
}

@JsonSerializable()
class DataLoginLate extends Equatable {
  final String visitTime;
  final String? lateTime;
  final String policyTime;

  DataLoginLate({
    required this.visitTime,
    this.lateTime,
    required this.policyTime,
  });

  factory DataLoginLate.fromJson(Map<String, dynamic> json) =>
      _$DataLoginLateFromJson(json);

  Map<String, dynamic> toJson() => _$DataLoginLateToJson(this);

  @override
  List<Object?> get props => [
    visitTime,
    lateTime,
    policyTime,
  ];
}
