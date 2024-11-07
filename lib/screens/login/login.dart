import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/screens/home_page/home_page.dart';
import 'package:login/screens/login/bloc_login/login_bloc.dart';
import 'package:login/screens/login/bloc_login/login_event.dart';
import 'package:login/utils/app_images.dart';
import 'package:login/utils/pallete.dart';
import 'package:login/widgets/button_submit.dart';
import 'package:login/widgets/input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? selectedLanguage;
  final List<Map<String, String>> languages = [
    {
      'code': 'vi',
      'flag': 'flag_vn.jpg',
    },
    {
      'code': 'en',
      'flag': 'flag_vn.jpg',
    },
  ];

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedLanguage = 'vi';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          DropdownButton<String>(
            value: selectedLanguage,
            items: languages.map((language) {
              return DropdownMenuItem<String>(
                value: language['code'],
                child: Image.asset(
                  AppImages.getImages(language['flag']!),
                  height: 40,
                  width: 60,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedLanguage = value;
              });
            },
          ),

        ],
      ),
      body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Pallete.background1Color,
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                        width: 200,
                        child: Image.asset(AppImages.getImages('logo.jpg')
                        )
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(50),
                  ),
                  color: Pallete.background2Color,
                ),
                height: double.infinity,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            width: 60,
                            child: Image.asset(AppImages.getImages('esale.png'))
                        ),
                        const Text(
                          'eSales SFA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const Text(
                          'CJFood',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text(
                          'Phiên bản eSale ngày 23/10/2024',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 320,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 20),
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(hintText: 'Username', textEditingController: usernameController,icon: Icons.account_circle_outlined,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InputField(hintText: 'Password', textEditingController: passwordController, icon: Icons.lock_open_outlined,isPassword: true,),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ButtonSubmit(name: "Đăng nhập", onPressed: (){
                            final username = usernameController.text;
                            final password = passwordController.text;

                            context.read<LoginBloc>().add(
                                LoginSubmitted(username: username, password: password)
                            );

                          }, screen: const HomePage(),
                        )
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
