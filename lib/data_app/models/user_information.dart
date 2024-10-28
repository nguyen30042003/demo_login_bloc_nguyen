import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_information.g.dart';

@JsonSerializable()
class UserInformation extends Equatable{
  final String userName;
  final String address;
  final String fullName;
  final String email;
  final String tel;
  final String avatar;
  final String roleID;
  final String roleDesc;
  final String distributorName;

  const UserInformation({
    required this.userName,
    required this.address,
    required this.fullName,
    required this.email,
    required this.tel,
    required this.avatar,
    required this.roleID,
    required this.roleDesc,
    required this.distributorName
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationToJson(this);

  @override
  List<Object?> get props => [
    userName,
    address,
    fullName,
    email,
    tel,
    avatar,
    roleID,
    roleDesc,
    distributorName
  ];
}