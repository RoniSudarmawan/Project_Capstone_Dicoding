import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/helper/page_helper.dart';
import 'package:capstone_project/provider/authentication_provider.dart';
import 'package:capstone_project/style/text_style.dart';
import 'package:capstone_project/user_interface/detail_screen/detail_screen.dart';
import 'package:capstone_project/user_interface/homepage_screen/homepage_screen.dart';
import 'package:capstone_project/user_interface/homepage_screen/newest_product_screen.dart';
import 'package:capstone_project/user_interface/homepage_screen/recommended_list_screen.dart';
import 'package:capstone_project/user_interface/login_screen/landing_screen.dart';
import 'package:capstone_project/user_interface/login_screen/login_screen.dart';
import 'package:capstone_project/user_interface/login_screen/signup_screen.dart';
import 'package:capstone_project/user_interface/notification_screen/notification_screen.dart';
import 'package:capstone_project/user_interface/payment_screen/payment_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/change_password_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/edit_profile_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/profile_screen.dart';
import 'package:capstone_project/user_interface/search_screen/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthenticationProvider(service: Authentication()),
      child: MaterialApp(
        title: 'Clothal',
        theme: ThemeData(
          textTheme: myTextTheme,
        ),
        home: Consumer<AuthenticationProvider>(builder: (context, snapshot, _) {
          if (snapshot.isSignIn) {
            return PageHelper();
          } else {
            return LandingScreen();
          }
        }),
        routes: {
          '/LandingScreen': (context) => LandingScreen(),
          '/LoginScreen': (context) => LoginScreen(),
          '/SignupScreen': (context) => SignupScreen(),
          '/PageHelper': (context) => PageHelper(),
          '/PaymentScreen': (context) => PaymentScreen(),
          '/HomepageScreen': (context) => HomepageScreen(),
          '/DetailScreen': (context) => DetailScreen(),
          '/RecommendedListScreen': (context) => RecommendedListScreen(),
          '/NewestProductScreen': (context) => NewestProductScreen(),
          '/ProfileScreen': (context) => ProfileScreen(),
          '/NotificationScreen': (context) => NotificationScreen(),
          '/ChangePasswordScreen': (context) => ChangePasswordScreen(),
          '/EditProfileScreen': (context) => EditProfileScreen(),
          '/SearchScreen': (context) => SearchScreen(),
        },
      ),
    );
  }
}
