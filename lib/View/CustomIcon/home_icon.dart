import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ReusableWidgets/slide_show.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(5),
        child: Image.asset('images/icons/home.png',
        height: 25,
        width: 25,
        color: Colors.white,),
      ),
    );
  }
}