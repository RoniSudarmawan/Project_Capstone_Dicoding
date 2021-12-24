import 'package:capstone_project/database/authentication.dart';
import 'package:capstone_project/database/rent_service.dart';
import 'package:capstone_project/helper/page_helper.dart';
import 'package:capstone_project/model/data_clothes_model.dart';
import 'package:capstone_project/model/list_clothes_model.dart';
import 'package:capstone_project/provider/authentication_provider.dart';
import 'package:capstone_project/provider/dart_theme_provider.dart';
import 'package:capstone_project/provider/payment_provider.dart';
import 'package:capstone_project/style/text_style.dart';
import 'package:capstone_project/user_interface/authentication_screen/landing_screen.dart';
import 'package:capstone_project/user_interface/authentication_screen/login_screen.dart';
import 'package:capstone_project/user_interface/authentication_screen/signup_screen.dart';
import 'package:capstone_project/user_interface/detail_screen/detail_screen.dart';
import 'package:capstone_project/user_interface/homepage_screen/homepage_screen.dart';
import 'package:capstone_project/user_interface/homepage_screen/newest_product_screen.dart';
import 'package:capstone_project/user_interface/payment_screen/payment_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/edit_profile_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/profile_screen.dart';
import 'package:capstone_project/user_interface/profile_screen/setting_screen.dart';
import 'package:capstone_project/user_interface/rent_history_screen/rent_history_screen.dart';
import 'package:capstone_project/user_interface/search_screen/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helper/preference_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthenticationProvider(service: Authentication()),
        ),
        ChangeNotifierProvider(
          create: (_) => PaymentProvider(rentService: RentService()),
        ),
        ChangeNotifierProvider<DarkThemeProvider>(
          create: (_) => DarkThemeProvider(
              preferencesHelper: PreferencesHelper(
                  sharedPreferences: SharedPreferences.getInstance())),
        )
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, theme, _) {
        return MaterialApp(
          theme: theme.themeData.copyWith(
            textTheme: myTextTheme,
          ),
          home:
              Consumer<AuthenticationProvider>(builder: (context, snapshot, _) {
            if (snapshot.isSignIn) {
              return const PageHelper();
            } else {
              return const LandingScreen();
            }
          }),
          routes: {
            '/LandingScreen': (context) => LandingScreen(),
            '/LoginScreen': (context) => LoginScreen(),
            '/SignupScreen': (context) => SignupScreen(),
            '/PageHelper': (context) => PageHelper(),
            '/PaymentScreen': (context) => PaymentScreen(
                dataClothes:
                    ModalRoute.of(context)?.settings.arguments as DataClothes,
                clothesSize:
                    ModalRoute.of(context)?.settings.arguments as String,
                price: ModalRoute.of(context)?.settings.arguments as int,
                duration: ModalRoute.of(context)?.settings.arguments as int),
            '/HomepageScreen': (context) => HomepageScreen(),
            '/DetailScreen': (context) => DetailScreen(
                  clothesId:
                      ModalRoute.of(context)?.settings.arguments as String,
                ),
            '/NewestProductScreen': (context) => NewestProductScreen(
                  clothes: ModalRoute.of(context)?.settings.arguments
                      as List<ListClothes>,
                  context: ModalRoute.of(context)?.settings.arguments
                      as BuildContext,
                  title: ModalRoute.of(context)?.settings.arguments as String,
                ),
            '/ProfileScreen': (context) => ProfileScreen(),
            '/NotificationScreen': (context) => RentHistoryScreen(),
            '/EditProfileScreen': (context) => EditProfileScreen(),
            '/SearchScreen': (context) => SearchScreen(),
            '/SettingScreen': (context) => SettingScreen(),
          },
        );
      }),
    );
  }
}
