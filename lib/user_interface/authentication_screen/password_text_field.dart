import 'package:capstone_project/style/color_style.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
    required this.passwordTextController,
  }) : super(key: key);

  final TextEditingController passwordTextController;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _formKey,
      controller: widget.passwordTextController,
      obscureText: _isPasswordVisible,
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Silahkan isi password Anda";
        } else if (value.length < 6) {
          return "Password harus lebih dari 6 karakter";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: "Password",
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: _isPasswordVisible
                  ? Icon(
                      Icons.remove_red_eye,
                      color: surface,
                    )
                  : Icon(
                      Icons.remove_red_eye,
                      color: secondaryColor,
                    )),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor900, width: 2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: primaryColor900, width: 2),
        ),
      ),
    );
  }
}
