import 'package:flutter/material.dart';
import 'package:news_short/Model/model.dart';
import 'package:news_short/Services/utilities/state_services.dart';

import 'View/ReusableWidgets/category_list.dart';
import 'View/ReusableWidgets/menu_bar.dart';
import 'View/ReusableWidgets/news_card.dart';
import 'View/ReusableWidgets/slide_show.dart';

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

class Reusablecode extends StatelessWidget {
  const Reusablecode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer( // Add a Drawer widget here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the UI based on the drawer item selected.
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the UI based on the drawer item selected.
              },
            ),
            // Add more ListTile widgets for additional items if needed
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, color: Colors.black,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks_rounded, color: Colors.black), label: 'Mark'),
          BottomNavigationBarItem(icon: Icon(Icons.network_check, color: Colors.black), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.black), label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // const MenuBarWidget(),
            ReusableText(text: 'Breaking News'),
            SlideShow(),
            const CategoryList(),
            ReusableText(text: 'For You'),
            const NewsCard(),
          ],
        ),
      ),
    );
  }
}
