import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class BodyTitle extends StatelessWidget {
  const BodyTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
      child: Text(
        'Categories',
        style: AppTextStyles.homeTitleTextStyle,
      ),
    );
  }
}
