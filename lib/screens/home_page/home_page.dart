import 'package:flutter/material.dart';
import 'package:login/utils/pallete.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Pallete.background2Color,
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
