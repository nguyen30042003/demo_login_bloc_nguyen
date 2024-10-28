import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/models/authentication_request.dart';
import 'package:login/data_app/models/authentication_response.dart';
import 'package:login/screens/login/bloc_login/login_event.dart';
import 'package:login/screens/login/bloc_login/login_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data_app/repository/authentication_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc(this._authenticationRepository) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        AuthenticationRequest authenticationRequest = AuthenticationRequest(
          username: event.username,
          password: event.password,
          imei: "",
        );
        AuthenticationResponse authenticationResponse = await _authenticationRepository.authentication(authenticationRequest);
        if (authenticationResponse != null) {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('jwtToken', authenticationResponse.accessToken);
          emit(LoginLoaded(isAuthenicated: true));
        } else {
          emit(LoginLoaded(isAuthenicated: false));
        }
      } catch (e) {
        emit(LoginFailure(message: 'Error processing login'));
      }
    });
  }
}
