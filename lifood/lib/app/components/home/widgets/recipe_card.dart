import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final data;
  const RecipeCard({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.only(right: 10),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, i) {
          return Card(
            color: Colors.transparent,
            child: Container(
              height: 200,
              width: 200,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    data[i]['images'][0]['hostedLargeUrl'],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
