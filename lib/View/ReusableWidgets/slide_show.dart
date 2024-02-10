import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_short/Model/model.dart';
import 'package:news_short/Services/utilities/state_services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideShow extends StatefulWidget {
  SlideShow({super.key});

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  int activeIndex = 0;

  StateService stateService = StateService();

  final List colorList = [
    const Color(0xff05be54),
    const Color(0xffbeb505),
    const Color(0xff6b05be),
    const Color(0xffe7c2ee),
    const Color(0xff23b3e1),
  ];

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: stateService.fetchNewsArticles(),
            builder: (context, AsyncSnapshot<NewsQueryModel>snapshot) {
              if (!snapshot.hasData) {
                return const Text('Loading..');
              } else {
                return CarouselSlider.builder(
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data!.articles![index].urlToImage.toString()),
                              fit: BoxFit.cover
                            )),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        height: 200,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index)));
              }
            },) ,
        const SizedBox(height: 20),
        AnimatedSmoothIndicator(
          effect: const ExpandingDotsEffect(
              dotWidth: 8, dotHeight: 8, activeDotColor: Color(0xff020e15)),
          activeIndex: activeIndex,
          count: colorList.length,
        )
      ],
    );
  }
}
