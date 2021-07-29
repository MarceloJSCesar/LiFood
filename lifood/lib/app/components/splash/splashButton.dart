import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class SplashButton extends StatelessWidget {
  final String text;
  const SplashButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
        left: 30,
        right: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: AppTextStyles.authTextStyle,
      ),
    );
  }
}
