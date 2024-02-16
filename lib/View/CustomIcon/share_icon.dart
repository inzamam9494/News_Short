import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ReusableWidgets/slide_show.dart';

class ShareIcon extends StatefulWidget {
  final GestureTapCallback onTap;
  const ShareIcon({super.key,required this.onTap});

  @override
  State<ShareIcon> createState() => _ShareIconState();
}

class _ShareIconState extends State<ShareIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .05,
        width: MediaQuery.of(context).size.height * .05,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25)
        ),
        child: Padding(
            padding: const EdgeInsets.all(9),
            child: Image.asset('images/icons/share.png')),
      ),
    );
  }
}