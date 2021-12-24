import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 24, top: 24),
                    child: Icon(
                      Icons.all_inclusive,
                      size: 130,
                      color: primaryColor100,
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "CLOTHAL",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.white),
              ),
            ),
            Text(
              "Find Your Own Favorite\nFormal Clothes to Rent",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 52.0, bottom: 8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/LoginScreen');
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: const StadiumBorder(),
                      fixedSize: Size(size.width, 20)),
                  child: Text(
                    "Login",
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(color: primaryColor900, fontSize: 15),
                  )),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignupScreen');
                },
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    primary: primaryColor900,
                    shape: const StadiumBorder(),
                    fixedSize: Size(size.width, 20)),
                child: Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white, fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
