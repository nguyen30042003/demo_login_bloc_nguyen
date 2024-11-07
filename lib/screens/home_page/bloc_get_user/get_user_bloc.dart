import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/models/user_information.dart';
import 'package:login/data_app/repository/user_repository.dart';
import 'package:login/screens/home_page/bloc_get_user/get_user_event.dart';
import 'package:login/screens/home_page/bloc_get_user/get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final UserRepository _userRepository;

  GetUserBloc(this._userRepository) : super(GetUserInitial()) {
    on<GetUserInformation>((event, emit) async {
      emit(GetUserLoading());
      try {
        UserInformation userInformation = await _userRepository.fetchUserInformation();
        emit(GetUserLoaded(userInformation: userInformation));
            } catch (e) {
        emit(GetUserFailure(message: 'Error processing login'));
      }
    });
  }
}
