import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:news_short/View/CustomIcon/bookmark_icon.dart';
import 'package:news_short/View/CustomIcon/share_icon.dart';
import 'package:share_plus/share_plus.dart';

import 'CustomIcon/back_icon.dart';

class NewsDetailScreen extends StatefulWidget {
  String title, name, urlToImage, content, dateTime, share;

  NewsDetailScreen(
      {super.key,
      required this.title,
      required this.name,
      required this.urlToImage,
      required this.content,
      required this.dateTime,
      required this.share});

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: BackIcon(
              onTap: () {
                Navigator.pop(context);
              },
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: BookMarkIcon(onTap: () {})),
                ShareIcon(
                  onTap: () => Share.share(widget.share),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.50,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.urlToImage),
                      fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [
                            Colors.black12.withOpacity(0),
                            Colors.black.withOpacity(1)
                          ])),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Text(
                        widget.title,
                        style:
                            const TextStyle(color: Colors.white,
                                fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            formatDate(DateTime.parse(widget.dateTime),
                                [yyyy, '-', mm, '-', dd]),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                    ]),
                  ),
                ))
          ]),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                widget.name,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.content,
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
