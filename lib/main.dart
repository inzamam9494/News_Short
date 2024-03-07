import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_short/Authentication/auth_page.dart';
import 'package:news_short/SampleCheking.dart';
import 'package:news_short/View/home.dart';
import 'package:news_short/View/news_detail_screen.dart';
import 'package:news_short/View/news_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

List<Map<String, dynamic>> bookMarks = [];

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthPage()
    );
  }
}

