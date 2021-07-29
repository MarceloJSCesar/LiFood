import 'package:flutter/material.dart';
import '../../../app/config/app_textstyles.dart';

class SplashButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const SplashButton({
    Key key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
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
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 4,
              offset: Offset.fromDirection(0, 0.5),
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Text(
          text,
          style: AppTextStyles.authTextStyle,
        ),
      ),
    );
  }
}
