import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class RecipeDoneView extends StatelessWidget {
  const RecipeDoneView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://media.giphy.com/media/iJc5ynT1VwAUPN55e6/source.gif'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Well Done ! I want to test it',
              style: AppTextStyles.homeDateTextStyle,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Leave',
          style: AppTextStyles.homeDetailIngredientsButtonTextStyle,
        ),
        backgroundColor: Colors.red.withOpacity(0.3),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
