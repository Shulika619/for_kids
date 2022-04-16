import 'package:flutter/material.dart';
import 'package:for_kids/pages/audio_screen.dart';
import 'package:for_kids/pages/game_screen.dart';
import 'package:for_kids/pages/video_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  late PageController _pageController;

  List<Widget> widgetOptions = <Widget>[
    const VideoScreen(),
    const AudioScreen(),
    const GameScreen(),
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
              label: "Видео",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.queue_music_outlined),
              label: "Аудио",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Игра",
            ),
          ],
        ));
  }
}




