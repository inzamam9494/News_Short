import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_short/Services/utilities/state_services.dart';
import 'package:news_short/View/ReusableWidgets/slide_show.dart';

import '../../Model/news_category.dart';

class CategoryList extends StatefulWidget {
   const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // final format = DateFormat('MMMM dd, yyyy');
  String categoryName = 'technology';

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
    return Column(
      children:[
      SizedBox(
              height: 100,
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
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: MediaQuery.of(context).size.width * 0.18,
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
        SizedBox(
        height: 500,
        child: FutureBuilder(
            future: stateService.fetchNewsCategoryApi(categoryName),
            builder: (context, AsyncSnapshot<NewsCategory>snapshot){
              if(!snapshot.hasData){
                return const Text('Loading..');
              } else{
                return ListView.builder(
                  shrinkWrap: true,
                    itemCount: snapshot.data!.articles!.length,
                    itemBuilder: (context, index){
                      return Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(snapshot.data!.articles![index].urlToImage.toString())
                            )
                        ),
                      );
                    });
              }
            }),
      ),
    ]
    );
  }
}

