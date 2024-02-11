import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';

class MenuIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  const MenuIcon({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.height * .05,
        decoration: BoxDecoration(
          color: newsIconColor,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
          padding: EdgeInsets.all(9),
            child: Image.asset('images/icons/menu.png')),
      ),
    );
  }
}

