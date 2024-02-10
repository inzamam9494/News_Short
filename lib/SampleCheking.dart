import 'package:flutter/material.dart';
import 'package:news_short/Model/model.dart';
import 'package:news_short/Services/utilities/state_services.dart';

class SampleChecking extends StatefulWidget {
  const SampleChecking({super.key});

  @override
  State<SampleChecking> createState() => _SampleCheckingState();
}

class _SampleCheckingState extends State<SampleChecking> {

  StateService stateService = StateService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: stateService.fetchNewsArticles(),
              builder: (context, AsyncSnapshot<NewsQueryModel>snapshot){
                if(!snapshot.hasData){
                  return const Text('Loading...');
                }else{
                  return ListView.builder(
                    itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index){
                      return Column(
                        children: [
                          Image.network(snapshot.data!.articles![index].
                          urlToImage.toString())
                        ],
                      );
                      }
                  );
                }
              })
      ),
    );
  }
}
