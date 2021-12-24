import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/homepage_screen/homepage_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/profile_screen.dart';
import 'package:capstone_project/user_interface/rent_history_screen/rent_history_screen.dart';
import 'package:capstone_project/user_interface/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class PageHelper extends StatefulWidget {
  const PageHelper({Key? key}) : super(key: key);

  @override
  _PageHelperState createState() => _PageHelperState();
}

class _PageHelperState extends State<PageHelper> {
  final _controller = PageController(
    initialPage: 0,
  );

  List<String> asset = [
    "/HomepageScreen",
    "/SearchScreen",
    "/NotificationScreen",
    "/ProfileScreen",
  ];
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.pinned;
  EdgeInsets padding = EdgeInsets.zero;

  SnakeShape snakeShape = SnakeShape.indicator;

  int _selectedItemPosition = 0;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = false;

  Color selectedColor = primaryColor900;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        child: PageView(
          controller: _controller,
          children: const <Widget>[
            HomepageScreen(),
            SearchScreen(),
            RentHistoryScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        padding: padding,
        snakeViewColor: selectedColor,
        selectedItemColor:
            snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: primaryColor100,
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,
        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() {
          _selectedItemPosition = index;
          _controller.jumpToPage(index);
        }),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Rent History'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
