import 'package:flutter/material.dart';
import 'package:news_short/View/CustomIcon/menu_icon.dart';
import 'package:news_short/View/CustomIcon/search_icon.dart';
import 'package:news_short/View/ReusableWidgets/category_list.dart';
import 'package:news_short/View/ReusableWidgets/detail_screen_icons.dart';
import 'package:news_short/View/ReusableWidgets/menu_bar.dart';
import 'package:news_short/View/ReusableWidgets/news_card.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  String categoryName = 'technology';

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
      // drawer: const Drawer(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
            MenuBarWidget(
                onTapMenu: (){
                  _globalKey.currentState!.openDrawer();
                },
                onTapSearch: (){},
                onTapBell: (){},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ReusableText(text: 'Breaking News'),
            SlideShow(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CategoryList()
          ],
        ),
      ),
    );
  }
}
