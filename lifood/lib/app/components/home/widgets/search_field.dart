import 'package:flutter/material.dart';
import '../../../../app/config/app_textstyles.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyles.homeFieldTextStyle,
      decoration: InputDecoration(
        hintText: 'Search for food',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => print('searching ...'),
          icon: Icon(
            Icons.search,
            size: 26,
          ),
          color: Colors.grey,
        ),
      ),
    );
  }
}
