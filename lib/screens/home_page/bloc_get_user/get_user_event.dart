import 'package:equatable/equatable.dart';

abstract class GetUserEvent extends Equatable{

  const GetUserEvent();

  @override
  List<Object?> get props => [];

}

class GetUserInformation extends GetUserEvent{
  const GetUserInformation();

  @override
  List<Object?> get props => [];
}