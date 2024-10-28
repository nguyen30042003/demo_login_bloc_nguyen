// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['accessToken'] as String,
      checkInBranchData: json['checkInBranchData'],
      dataLoginLate: json['dataLoginLate'] == null
          ? null
          : DataLoginLate.fromJson(
              json['dataLoginLate'] as Map<String, dynamic>),
      isChangePassword: json['isChangePassword'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'checkInBranchData': instance.checkInBranchData,
      'dataLoginLate': instance.dataLoginLate,
      'isChangePassword': instance.isChangePassword,
    };

DataLoginLate _$DataLoginLateFromJson(Map<String, dynamic> json) =>
    DataLoginLate(
      visitTime: json['visitTime'] as String,
      lateTime: json['lateTime'] as String?,
      policyTime: json['policyTime'] as String,
    );

Map<String, dynamic> _$DataLoginLateToJson(DataLoginLate instance) =>
    <String, dynamic>{
      'visitTime': instance.visitTime,
      'lateTime': instance.lateTime,
      'policyTime': instance.policyTime,
    };
