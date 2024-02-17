import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:news_short/Services/utilities/state_services.dart';
import 'package:news_short/main.dart';

import 'news_detail_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bookMarks.length,
          itemBuilder: (context, index){
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(
              id: bookMarks[index]['id'],
              title: bookMarks[index]['title'],
              name: bookMarks[index]['name'],
              urlToImage: bookMarks[index]['urlToImage'],
              content: bookMarks[index]['content'],
              dateTime: bookMarks[index]['date'],
              share: bookMarks[index]['share'],))),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(bookMarks[index]['urlToImage'])
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Text(bookMarks[index]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15
                          ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bookMarks[index]['date']),
                            Text(formatDate(DateTime.parse(bookMarks[index]['date']),
                                [yyyy, '-', mm, '-', dd]),)

                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
          }
      ),
    );
  }
}
