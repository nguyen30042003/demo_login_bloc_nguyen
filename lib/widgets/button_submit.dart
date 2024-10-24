import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/home_page/home_page.dart';
import 'package:login/screens/login/bloc_login/login_bloc.dart';
import 'package:login/screens/login/bloc_login/login_state.dart';
import 'package:login/utils/pallete.dart';

class ButtonSubmit extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Widget screen;
  const ButtonSubmit({super.key, required this.name, required this.onPressed, required this.screen});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state is LoginLoaded) {
          if (state.isAuthenicated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => screen,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Invalid username or password")),
            );
          }
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: state is! LoginLoading
                  ? onPressed
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Pallete.background2Color,
                shadowColor: Colors.transparent,
                fixedSize: const Size(395, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bo góc 10
                ),
              ),
              child: state is LoginLoading
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
                  : Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
