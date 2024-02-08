import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarIcon extends StatelessWidget {
  const TopBarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          Icon(Icons.arrow_back),
          Row(
          children: [
            Icon(Icons.bookmark),
            SizedBox(width: 10),
            Icon(Icons.share)
          ],
        ),
      ]
      ),
    );
  }
}

class NewsSource extends StatelessWidget {
  const NewsSource({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Text("ET"),
          ),
          Column(
            children: [
              Text('The Economics Time')
            ],
          )
        ],
      ),
    );
  }
}

const String text = "Harish Rawat, former chief minister of Uttarakhand, said the state government and Chief Minister Dhami are not following the rules in eagerness to pass the bill.The former chief minister said the members don’t have the draft copy of the bill and the government wants an immediate discussion on it.No one has the draft copy and they want an immediate discussion on it. The central government is using a sensitive state like Uttarakhand for tokenism, if they want to bring UCC, it should have been brought by the central government, he told ANI.It is important to note that the ruling Bharatiya Janata Party (BJP) had promised the Uniform Civil Code bill during the 2022 Assembly elections in the state. After becoming a law, the bill will replace the personal religious laws that govern marriage, divorce, inheritance etc.";
