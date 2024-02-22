import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final GestureTapCallback onTap;
  const SquareTile({
    super.key,
    required this.imagePath,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]
          ),
          child: Image.asset(imagePath,
          height: 70,),
        ),
      ),
    );
  }
}

