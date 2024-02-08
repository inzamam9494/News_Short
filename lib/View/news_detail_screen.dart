import 'package:flutter/material.dart';
import 'package:news_short/View/ReusableWidgets/detail_screen_icons.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
            children: [
          Stack(children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(25)),
            ),
            const TopBarIcon(),
          ]),
              SizedBox(height: 10,),
              NewsSource(),
              const Text(text)
        ]),
      ),
    );
  }
}
