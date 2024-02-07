import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/View/news_detail_screen.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen()));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Text('Chelsea Confirm silva out with knee ligament damage'),
               Row(children: [
                 Text('Sky Sport  '),
                 Text('Feb 28, 2023')
               ],)
              ],
            ),
          )
        ],
      ),
    );
  }
}
