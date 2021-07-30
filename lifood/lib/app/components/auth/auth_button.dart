import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class AuthButton extends StatelessWidget {
  final String text;
  const AuthButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.lightBlue.withOpacity(0.1),
          border: Border.all(
            color: Colors.lightBlue,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: AppTextStyles.authButtonTextStyle,
        ),
      ),
    );
  }
}
