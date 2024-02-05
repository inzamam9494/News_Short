import 'package:flutter/material.dart';
import 'package:news_short/View/news_screen.dart';

const source = "https://source.unsplash.com/random";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
              decoration: const BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(source), fit: BoxFit.cover),
          )),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.topCenter,
                  end: AlignmentDirectional.bottomCenter,
                  colors: [
                    Colors.black12.withOpacity(0),
                    Colors.black.withOpacity(1)
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
              const Text(
                'News from around the world for you',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .02),
              const Text(
                'Best time to read, take your time to read a little more of this world',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                    fontSize: 15),
              ),
                  SizedBox(height: MediaQuery.of(context).size.height * .07),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsScreen()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 65),
                    child: Text(
                        'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
                  SizedBox(height: MediaQuery.of(context).size.height * .04),
            ]),
          ),
        ]),
      ),
    );
  }
}
