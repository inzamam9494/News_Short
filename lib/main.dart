import 'package:flutter/material.dart';
import 'package:news_short/SampleCheking.dart';
import 'package:news_short/View/home.dart';
import 'package:news_short/View/news_detail_screen.dart';
import 'package:news_short/View/news_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}

