import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_rounded,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_active,
          ),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        )
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      backgroundColor: primaryColor900,
      selectedItemColor: Colors.white,
      unselectedItemColor: secondaryColor,
      showUnselectedLabels: false,
    );
  }
}
