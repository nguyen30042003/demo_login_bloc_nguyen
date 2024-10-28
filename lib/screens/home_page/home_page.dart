import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/data_app/repository/user_repository.dart';
import 'package:login/screens/home_page/bloc_get_user/get_user_bloc.dart';
import 'package:login/screens/home_page/bloc_get_user/get_user_event.dart';
import 'package:login/utils/pallete.dart';

import 'bloc_get_user/get_user_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.background1Color,
      body: BlocProvider(
        create: (_) => GetUserBloc(UserRepository())..add(GetUserInformation()),
        child: BlocBuilder<GetUserBloc, GetUserState>(
          builder: (context, state) {
            if (state is GetUserLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else if (state is GetUserLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Full name: ${state.userInformation.fullName}",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "Username: ${state.userInformation.userName}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "Email: ${state.userInformation.email}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "Telephone: ${state.userInformation.tel}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            }
            else if (state is GetUserFailure) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
