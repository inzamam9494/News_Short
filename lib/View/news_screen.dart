import 'package:flutter/material.dart';
import 'package:news_short/View/ReusableWidgets/category_list.dart';
import 'package:news_short/View/ReusableWidgets/menu_bar.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.black,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks_rounded, color: Colors.black), label: 'Mark'),
          BottomNavigationBarItem(icon: Icon(Icons.network_check, color: Colors.black), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ],
      ),
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
                onTapSearch: (){},
                onTapBell: (){},
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ReusableText(text: 'Breaking News'),
            SlideShow(),
            CategoryList()
          ],
        ),
      ),
    );
  }
}
