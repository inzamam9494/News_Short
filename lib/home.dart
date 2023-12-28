import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10)
            ),
            child:  const Row(
              children: [
                Icon(Icons.search,
                  color: Colors.blue,
                ),
                Expanded(child: TextField(
                  textInputAction: TextInputAction.search,
                  onSubmitted: (){},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Health"
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
