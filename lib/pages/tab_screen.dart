import 'package:flutter/material.dart';
import 'package:for_kids/pages/video_screen.dart';
import 'package:for_kids/pages/audio_screen.dart';
import 'package:for_kids/pages/animals_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 1;
  late PageController _pageController;

  List<Widget> widgetOptions = <Widget>[
    const VideoScreen(),
    const AudioScreen(),
    const AnimalsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void onTabTapped(int index) {
    if (_selectedIndex == index) {
      return;
    } // проверка, если уже нажата, то ничего не делать
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PageView(
            children: widgetOptions,
            onPageChanged: onPageChanged,
            controller: _pageController,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: onTabTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.video_camera_back_outlined),
              label: "Мультфильмы",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.queue_music_outlined),
              label: "Колыбельные",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.catching_pokemon),
              label: "Животные",
            ),
          ],
        ));
  }
}




