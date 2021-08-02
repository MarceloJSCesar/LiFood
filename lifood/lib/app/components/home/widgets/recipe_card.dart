import 'package:flutter/material.dart';
import 'package:lifood/app/services/home/home_service.dart';
import 'package:shimmer/shimmer.dart';

import '../../custom_circular_progress_indicator.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HomeService().getListRecipies(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Shimmer.fromColors(
                child: Container(
                  width: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(right: 10),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, i) {
                      return Card(
                        color: Colors.transparent,
                        child: Container(
                          height: 200,
                          width: 200,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.grey.shade300,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                baseColor: Colors.transparent,
                highlightColor: Colors.grey);
          default:
            final data = snapshot.data;
            if (snapshot.data != null) {
              return Container(
                width: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.only(right: 10),
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        print(data[i]['name']);
                      },
                      child: Card(
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
                      ),
                    );
                  },
                ),
              );
            } else {
              return Center();
            }
        }
      },
    );
  }
}
