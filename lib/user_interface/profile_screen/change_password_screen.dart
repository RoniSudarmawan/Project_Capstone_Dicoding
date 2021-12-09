import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body: Column(
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
                  "Change Password",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: primaryColor100),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  left: 28.0,
                  right: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Previous Password",
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "New Password",
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Re-type Password",
                          suffixIcon: const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Icon(Icons.remove_red_eye),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor900, width: 2),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: primaryColor900,
                              shape: const StadiumBorder(),
                              fixedSize: Size(size.width, 20)),
                          child: Text(
                            "Change Password",
                            style: Theme.of(context)
                                .textTheme
                                .button!
                                .copyWith(color: Colors.white, fontSize: 15),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
