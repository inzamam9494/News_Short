import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:news_short/explore_news_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';

import '../Model/news_category.dart';
import '../Services/utilities/state_services.dart';
import 'ReusableWidgets/slide_show.dart';
import 'news_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  String categoryName = 'general';

  List<String> categoryList = [
    'general',
    'entertainment',
    'business',
    'health',
    'science',
    'sports',
    'technology'
  ];

  StateService stateService = StateService();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children:[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryList.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: (){
                            categoryName = categoryList[index];
                            setState(() {});
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.10,
                              width: MediaQuery.of(context).size.width * 0.30,
                              decoration: BoxDecoration(
                                  color: categoryName == categoryList[index] ? Colors.black : newsIconColor,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(child: Text(categoryList[index].toString(),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: categoryName == categoryList[index] ? Colors.white : Colors.black,
                                ),)),
                            ),
                          ),
                        );
                      }),
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.90,
                    child: FutureBuilder(
                        future: stateService.fetchNewsCategoryApi(categoryName),
                        builder: (context, AsyncSnapshot<NewsCategory>snapshot){
                          if(!snapshot.hasData){
                            return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: 10,
                                itemBuilder: (context, index){
                                  return Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.25),
                                      highlightColor: Colors.white.withOpacity(0.6),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Container(height: 10, width: 89, color: Colors.white),
                                            subtitle: Container(height: 10, width: 89, color: Colors.white),
                                          ),
                                        ],
                                      )
                                  );
                                });
                          } else{
                            var uuid = Uuid();
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.articles!.length,
                                itemBuilder: (context, index){
                                  DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                                  return InkWell(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExploreNewsView(
                                        url: snapshot.data!.articles![index].url.toString(),
                                      name: snapshot.data!.articles![index].source!.name.toString(),
                                    ))),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(10),
                                          height: MediaQuery.of(context).size.height * 0.15,
                                          width: MediaQuery.of(context).size.width * 0.35,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(snapshot.data!.articles![index].urlToImage.toString())
                                              )
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            child: Column(
                                              children: [
                                                Text(snapshot.data!.articles![index].title.toString(),
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 15
                                                  ),),
                                                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(snapshot.data!.articles![index].source!.name.toString(),
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.grey[500]
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(formatDate(dateTime, [MM,' ', dd, ',', yyyy]),
                                                        style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.grey[500]
                                                        ),),
                                                    )

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          }
                        }),
                  ),
                ),
              ]
          ),
        ),
      )
    );
  }
}
