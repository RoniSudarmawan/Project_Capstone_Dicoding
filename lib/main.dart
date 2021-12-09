import 'package:capstone_project/style/text_style.dart';
import 'package:capstone_project/user_interface/login_screen/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothal',
      theme: ThemeData(
        textTheme: myTextTheme,
      ),
      home: const LandingScreen(),
    );
  }
}
