import 'package:flutter/material.dart';
import 'package:log/pages/loginpage.dart';
import 'package:log/pages/registerpage.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreen(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreen );
    }else{
      return RegisterPage(showLoginPage: toggleScreen);
    }
  }
}
