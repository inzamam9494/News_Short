import 'package:flutter/material.dart';
import 'package:news_short/View/CustomIcon/explore_icon.dart';
import 'package:news_short/View/CustomIcon/home_icon.dart';
import 'package:news_short/View/CustomIcon/profile_icon.dart';
import 'package:news_short/View/CustomIcon/save_icon.dart';
import 'package:news_short/View/ReusableWidgets/category_list.dart';
import 'package:news_short/View/ReusableWidgets/menu_bar.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';
import 'package:news_short/View/bookmark_screen.dart';
import 'package:news_short/View/explore_screen.dart';
import 'package:news_short/View/profile_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  String categoryName = 'general';

  List<String> categoryList = [
    'general',
    'entertainment',
    'business',
    'health',
    'science',
    'sports',
    'technology'
  ];

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: const Drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            MenuBarWidget(
                onTapMenu: (){
                  _globalKey.currentState!.openDrawer();
                },
                onTapBell: (){},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ReusableText(text: 'Breaking News'),
            SlideShow(),
            const CategoryList()
          ],
        ),
      ),
    );
  }
}
