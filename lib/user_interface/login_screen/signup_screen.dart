import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
          Padding(
            padding: const EdgeInsets.only(bottom: 40, top: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Sign Up",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  "Register Your New Account",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.white),
                ),
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
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 8.0, top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
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
                          padding:
                              const EdgeInsets.only(bottom: 8.0, top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Re-type Password",
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
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/LoginScreen');
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: primaryColor900,
                                  shape: const StadiumBorder(),
                                  fixedSize: Size(size.width, 20)),
                              child: Text(
                                "Sign Up",
                                style: Theme.of(context)
                                    .textTheme
                                    .button!
                                    .copyWith(
                                        color: Colors.white, fontSize: 15),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 36.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sudah Punya Akun?",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/LoginScreen');
                                  },
                                  child: Text(
                                    "Login",
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
