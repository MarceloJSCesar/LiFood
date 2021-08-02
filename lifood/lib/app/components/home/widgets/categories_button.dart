import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class CategoriesButton extends StatelessWidget {
  final String categorieTitle;
  final bool isButtonSelected;
  CategoriesButton({
    Key key,
    this.categorieTitle,
    this.isButtonSelected = false,
  })  : assert(['All', 'Vegetables', 'Protein', 'Fruits', 'Grains', 'Dairy']
            .contains(categorieTitle)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isButtonSelected
            ? Colors.grey.withOpacity(0.3)
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          categorieTitle,
          style: AppTextStyles.homeCategorieButtonTextStyle,
        ),
      ),
    );
  }
}
