import 'package:capstone_project/provider/authentication_provider.dart';
import 'package:capstone_project/style/color_style.dart';
import 'package:capstone_project/user_interface/authentication_screen/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController nameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController bornDateTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController retypePasswordTextController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryColor900,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 6.0, top: 8.0),
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
                              controller: nameTextController,
                              decoration: InputDecoration(
                                hintText: "Nama",
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
                              controller: bornDateTextController,
                              readOnly: true,
                              onTap: () => _selectedDate(context),
                              decoration: InputDecoration(
                                hintText: "Tanggal Lahir",
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
                              controller: emailTextController,
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
                              child: PasswordTextField(
                                  passwordTextController:
                                      passwordTextController)),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, top: 10.0),
                            child: TextField(
                              controller: retypePasswordTextController,
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
                                onPressed: () async {
                                  try {
                                    final result =
                                        Provider.of<AuthenticationProvider>(
                                            context,
                                            listen: false);
                                    await result.signUp(
                                      emailTextController.text,
                                      passwordTextController.text,
                                      nameTextController.text,
                                      DateTime.parse(
                                          bornDateTextController.text),
                                    );
                                    if (result.isSignIn) {
                                      Navigator.pushReplacementNamed(
                                          context, '/LoginScreen');
                                    }
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(e.toString())));
                                  }
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
      ),
    );
  }

  Future<Null> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year - 60),
        lastDate: DateTime(selectedDate.year + 1));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    bornDateTextController.text = selectedDate.toString();
  }
}
