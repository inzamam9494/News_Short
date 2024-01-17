import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_short/model.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final image1 = "https://img.freepik.com/free-vector/global-technology-earth-news-bulletin-background_1017-33687.jpg?w=1380&t=st=1705422365~exp=1705422965~hmac=63b7a112fd8d410a3da7f51c566dc598e58d81d15044178ecc64050400d4f8c7";
  TextEditingController searchController = TextEditingController();
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  List<String> navBarItem = ["Top News", "India", "World", "Finance", "Health"];

  bool isLoading = true;
  getNewsByQuery(String query) async{
    String url = "https://newsapi.org/v2/everything?q=$query&from=2023-12-17&sortBy=publishedAt&apiKey=9a316991d02c4794ad7d35e42ccf8d67";
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element){
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Short"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10)),
              child: const Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.blue,
                  ),
                  Expanded(
                      child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search Health"),
                  ))
                ],
              ),
            ),
            Container(
              height: 60,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: navBarItem.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(navBarItem[index]);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            navBarItem[index],
                            style: const TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 15),
            CarouselSlider(
                items: newsModelList.map((instance) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      child: Card(
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(instance.newsImg,
                                  fit: BoxFit.fitHeight,
                                  height: double.infinity),
                            ),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                        Colors.white.withOpacity(0),
                                        Colors.white
                                      ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter)),
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "News are here!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  });
                }).toList(),
                options: CarouselOptions(
                    height: 200, autoPlay: true, enableInfiniteScroll: false)),
            const SizedBox(height: 10,),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Latest News",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),)
                      ]
                  ),
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsModelList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Card(
                            elevation: 2.0,
                            child: Stack(
                              children: [
                                Image.network(newsModelList[index].newsImg),
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                            Colors.white.withOpacity(0),
                                            Colors.white
                                          ],
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            newsModelList[index].newsHead,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(newsModelList[index].newsDes.length > 50 ? "${newsModelList[index].newsDes.substring(0,55)}.." : newsModelList[index].newsDes,)
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                ElevatedButton(
                    onPressed: (){},
                    child: const Text("Show More"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

final List items = [
  Colors.black,
  Colors.blue,
  Colors.amber,
  Colors.purpleAccent,
  Colors.deepOrange
];
