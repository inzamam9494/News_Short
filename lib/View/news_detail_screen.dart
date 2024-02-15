import 'package:flutter/material.dart';
import 'package:news_short/View/CustomIcon/bookmark_icon.dart';
import 'package:news_short/View/CustomIcon/share_icon.dart';

import 'CustomIcon/back_icon.dart';

class NewsDetailScreen extends StatefulWidget {
  String title, name, urlToImage, content;

  NewsDetailScreen({
    super.key,
    required this.title,
    required this.name,
    required this.urlToImage,
    required this.content,
  });

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmarks_rounded, color: Colors.black),
              label: 'Mark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.network_check, color: Colors.black),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ],
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BackIcon(
              onTap: () {
                Navigator.pop(context);
              },
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BookMarkIcon(onTap: () {})),
                ShareIcon(
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.urlToImage), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
             widget.content,
              style: const TextStyle(
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }
}
