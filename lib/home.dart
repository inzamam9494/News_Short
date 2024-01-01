import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<String> navBarItem = ["Top News", "India", "World", "Finance", "Health"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Short"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(10)),
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
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(
                        child: Text(navBarItem[index],
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                  );
                }),
          )

          CarouselSlider(
            options: CarouselOptions(
              height: 200,
            ),
            items: items.map((item) {
            return Builder(
                builder: (BuildContext context) {
                  return Container(
                      decoration: BoxDecoration(
                          color: item
                      )
                  );
                }
            );
          }).toList(),
          ).toList()
        ],
      ),
    );
  }

  final List items = [
    Colors.black,
    Colors.blue,
    Colors.amber,
    Colors.purpleAccent,
    Colors.deepOrange
  ];
}
