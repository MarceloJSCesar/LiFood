import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class BodyTitle extends StatelessWidget {
  final String text;
  const BodyTitle({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
      child: Text(
        text,
        style: AppTextStyles.homeTitleTextStyle,
      ),
    );
  }
}
