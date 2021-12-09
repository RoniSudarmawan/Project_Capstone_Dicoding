import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 6.0, top: 8.0),
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
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(bottom: 40, top: 24),
                  child: Container(
                    child: Icon(
                      Icons.all_inclusive,
                      size: 100,
                      color: primaryColor100,
                    ),
                  )),
            ],
          ),
          Expanded(
            child: Container(
              width: size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 28.0,
                      left: 28.0,
                      right: 28.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Welcome Back",
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: primaryColor900),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Login to Your Account",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: primaryColor600),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Username",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor900, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor900, width: 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: const Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Icon(Icons.remove_red_eye),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor900, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor900, width: 2),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor900,
                                  shape: const StadiumBorder(),
                                  fixedSize: Size(size.width, 20)),
                              child: Text(
                                "Login",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                        color: Colors.white, fontSize: 15),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Center(
                              child: Text(
                            "or login with:",
                            style: Theme.of(context).textTheme.subtitle1,
                          )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.flight,
                                    size: 50,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.flight,
                                    size: 50,
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Tidak Punya Akun?",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.underline),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
