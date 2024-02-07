import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu),
          Row(
            children: [Icon(Icons.search),
              SizedBox(width: 10),
              Icon(Icons.notifications_none)],
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

