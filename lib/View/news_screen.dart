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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.black,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks_rounded, color: Colors.black), label: 'Mark'),
          BottomNavigationBarItem(icon: Icon(Icons.network_check, color: Colors.black), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const MenuBarWidget(),
            ReusableText(text: 'Breaking News'),
            SlideShow(),
            const CategoryList(),
            ReusableText(text: 'For You'),
          ],
        ),
      ),
    );
  }
}
