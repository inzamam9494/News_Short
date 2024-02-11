import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/View/CustomIcon/menu_icon.dart';
import 'package:news_short/View/CustomIcon/search_icon.dart';

import '../CustomIcon/bell_icon.dart';

class MenuBarWidget extends StatelessWidget {
  final GestureTapCallback onTapMenu;
  final GestureTapCallback onTapSearch;
  final GestureTapCallback onTapBell;
   MenuBarWidget({super.key,
    required this.onTapMenu,
    required this.onTapSearch,
    required this.onTapBell,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MenuIcon(onTap: onTapMenu),
          Row(
            children: [
              SearchIcon(onTap: onTapSearch),
              SizedBox(width: MediaQuery.of(context).size.width * 0.03),
              BellIcon(onTap: onTapBell)
            ],
          )
        ],
      ),
    );
  }
}

class ReusableText extends StatelessWidget {
  String text;
   ReusableText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children:[ Text(text,
          textAlign: TextAlign.start,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25
          ),
        ),]
      ),
    );
  }
}

