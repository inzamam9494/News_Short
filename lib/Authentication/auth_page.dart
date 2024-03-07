import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_short/Authentication/login_or_register_page.dart';
import 'package:news_short/Authentication/login_page.dart';
import 'package:news_short/View/home.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return HomeScreen();
            }else{
              return LoginOrRegisterPage();
            }
          }),
    );
  }
}
