import 'package:flutter/material.dart';
import 'package:news_short/View/profile_screen.dart';
import 'CustomIcon/explore_icon.dart';
import 'CustomIcon/home_icon.dart';
import 'CustomIcon/profile_icon.dart';
import 'CustomIcon/save_icon.dart';
import 'bookmark_screen.dart';
import 'explore_screen.dart';
import 'news_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int index = 0;

  final screen = [
    NewsScreen(),
    BookmarkScreen(),
    ExploreScreen(),
    ProfileScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            indicatorColor: Colors.transparent
        ),
        child: NavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
                icon: Image.asset('images/icons/home.png',
                height: 25,
                width: 25,),
                selectedIcon: const HomeIcon(),
                label: 'Home'),
            NavigationDestination(
                icon: Image.asset('images/icons/save.png',
                  height: 25,
                  width: 25,),
                selectedIcon: const SaveIcon(),
                label: 'Saved'),
            NavigationDestination(
                icon: Image.asset('images/icons/web.png',
                  height: 25,
                  width: 25,),
                selectedIcon: const ExploreIcon(),
                label: 'Explore'),
            NavigationDestination(
                icon: Image.asset('images/icons/user.png',
                  height: 25,
                  width: 25,),
                selectedIcon: const ProfileIcon(),
                label: 'Profile'),
          ],
        ),
      ),
      body: screen[index],
    );
  }
}
