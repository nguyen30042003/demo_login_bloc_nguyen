

import 'package:equatable/equatable.dart';
import 'package:login/data_app/models/user_information.dart';

abstract class GetUserState extends Equatable{
  const GetUserState();

  @override
  List<Object?> get props => [];
}

class GetUserInitial extends GetUserState{}

class GetUserLoading extends GetUserState{}

class GetUserLoaded extends GetUserState{
  UserInformation userInformation;

  GetUserLoaded({required this.userInformation});

  @override
  List<Object?> get props => [userInformation];
}

class GetUserFailure extends GetUserState{
  String message;

  GetUserFailure({required this.message});

  @override
  List<Object?> get props => [message];
}