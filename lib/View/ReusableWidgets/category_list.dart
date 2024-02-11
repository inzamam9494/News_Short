import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ListIcon(text: '+',),
            ListIcon(text: 'For you',),
            ListIcon(text: 'World',),
            ListIcon(text: 'India',),
            ListIcon(text: 'Politics',),
            ListIcon(text: 'Sports',),
            ListIcon(text: 'Business',),
            ListIcon(text: 'Economics',),
          ],
        ),
      ),
    );
  }
}

class ListIcon extends StatelessWidget {
  String text;

  ListIcon({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            color: newsIconColor, borderRadius: BorderRadius.circular(20)),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
