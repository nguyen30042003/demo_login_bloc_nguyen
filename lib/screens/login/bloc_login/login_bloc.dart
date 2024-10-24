

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/login/bloc_login/login_event.dart';
import 'package:login/screens/login/bloc_login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitial()){
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try{
        await Future.delayed(const Duration(seconds: 2));
        if(event.username == 'admin' && event.password == 'admin'){
          emit(LoginLoaded(isAuthenicated: true));
        }
        else{
          emit(LoginLoaded(isAuthenicated: false));
        }
      } catch(e){
        emit(LoginFailure(message: 'Error process login'));
      }
    });
  }
}