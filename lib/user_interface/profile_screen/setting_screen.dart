import 'package:capstone_project/provider/dart_theme_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                      child: IconButton(
                          color: primaryColor600,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: primaryColor100,
                          )),
                    ),
                    Text(
                      "Setting",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: primaryColor100),
                    )
                  ],
                ),
              ),
              Container(
                height: size.height / 1.1,
                width: size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 30, left: size.width / 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dark Mode",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Set this application to dark theme",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(color: primaryColor100),
                              ),
                            ],
                          ),
                          Consumer<DarkThemeProvider>(
                            builder: (context, theme, _) {
                              return Switch.adaptive(
                                value: theme.isDarkTheme,
                                onChanged: (value) async {
                                  theme.enableDarkTheme = value;
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
