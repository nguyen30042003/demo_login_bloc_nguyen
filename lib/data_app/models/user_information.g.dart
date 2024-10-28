// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    UserInformation(
      userName: json['userName'] as String,
      address: json['address'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      tel: json['tel'] as String,
      avatar: json['avatar'] as String,
      roleID: json['roleID'] as String,
      roleDesc: json['roleDesc'] as String,
      distributorName: json['distributorName'] as String,
    );

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'address': instance.address,
      'fullName': instance.fullName,
      'email': instance.email,
      'tel': instance.tel,
      'avatar': instance.avatar,
      'roleID': instance.roleID,
      'roleDesc': instance.roleDesc,
      'distributorName': instance.distributorName,
    };
