import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ReusableWidgets/slide_show.dart';

class BookMarkIcon extends StatelessWidget {
  final GestureTapCallback onTap;
   bool isBookmarked;

   BookMarkIcon(
      {super.key, required this.onTap, required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.height * .05,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: Padding(
            padding: const EdgeInsets.all(9),
            child: Icon(isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                color: isBookmarked ? Colors.red : Colors.black)),
      ),
    );
  }
}
