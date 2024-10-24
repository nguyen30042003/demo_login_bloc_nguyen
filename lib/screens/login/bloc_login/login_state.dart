import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginLoaded extends LoginState{
  bool isAuthenicated;

  LoginLoaded({required this.isAuthenicated});

  @override
  List<Object?> get props => [isAuthenicated];

}

class LoginFailure extends LoginState{
  String message;

  LoginFailure({required this.message});

  @override
  List<Object?> get props => [message];
}