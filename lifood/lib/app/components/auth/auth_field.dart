import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/auth/auth_controller.dart';

class AuthField extends StatelessWidget {
  final String label;
  final bool isEmail;
  final bool isPassword;
  final bool isPasswordVisible;
  final Function changeVisiblePasswordValue;
  final TextEditingController controller;
  const AuthField({
    Key key,
    this.label,
    this.isEmail,
    this.controller,
    this.isPassword,
    this.isPasswordVisible,
    this.changeVisiblePasswordValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          obscureText: isPassword
              ? isPasswordVisible
                  ? false
                  : true
              : false,
          textInputAction:
              isPassword ? TextInputAction.done : TextInputAction.next,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          style: AppTextStyles.authFieldTextStyle,
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () => changeVisiblePasswordValue(),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
