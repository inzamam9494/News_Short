import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/Model/model.dart';
import 'package:news_short/Services/utilities/state_services.dart';
import 'package:news_short/View/news_detail_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uuid/uuid.dart';

const newsIconColor = Color(0xffc1c1cf);

class SlideShow extends StatefulWidget {
  SlideShow({super.key});

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  int activeIndex = 0;

  StateService stateService = StateService();

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          FutureBuilder(
            future: stateService.fetchNewsArticles(),
            builder: (context, AsyncSnapshot<NewsQueryModel> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.25),
                      highlightColor: Colors.white.withOpacity(0.6),
                    child: Card(
                      child: Container(
                        height: 200,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                var uuid = Uuid();
                return CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                      return InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailScreen(
                          id: uuid.v4(),
                            source: snapshot.data!.articles![index].source.toString(),
                            title: snapshot.data!.articles![index].title.toString(),
                            name: snapshot.data!.articles![index].source!.name.toString(),
                            urlToImage: snapshot.data!.articles![index].urlToImage.toString(),
                            dateTime: snapshot.data!.articles![index].publishedAt.toString(),
                            share: snapshot.data!.articles![index].url.toString(),
                            content: snapshot.data!.articles![index].content.toString()))),
                        child: Container(
                          // width: double.infinity,
                          child: Card(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    snapshot.data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.fill,
                                    height: double.infinity,
                                  ),
                                ),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              begin:
                                                  AlignmentDirectional.topCenter,
                                              end: AlignmentDirectional
                                                  .bottomCenter,
                                              colors: [
                                            Colors.black12.withOpacity(0),
                                            Colors.black.withOpacity(1)
                                          ])),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                            children: [
                                          Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                            Text(
                                              snapshot.data!.articles![index]
                                                  .source!.name
                                                  .toString(),
                                              style: const TextStyle(color: Colors.white,
                                              fontSize: 12),
                                            ),
                                          ]),
                                          Text(
                                            snapshot.data!.articles![index].title.toString(),
                                            style: const TextStyle(color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index)));
              }
            },
          ),
          const SizedBox(height: 20),
          AnimatedSmoothIndicator(
            effect: const ExpandingDotsEffect(
                dotWidth: 8, dotHeight: 8, activeDotColor: Color(0xff020e15)),
            activeIndex: activeIndex,
            count: 5,
          )
        ],
      ),
    );
  }
}
