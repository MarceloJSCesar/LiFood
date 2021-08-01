import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lifood/app/components/home/widgets/body_title.dart';
import 'package:lifood/app/components/home/widgets/search_field.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/services/home/home_service.dart';

import 'package:typicons_flutter/typicons_flutter.dart';
import '../../../app/config/app_image_assets.dart';
import '../custom_circular_progress_indicator.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _homeService = HomeService();
  final DateTime now = DateTime.now();
  var date;
  @override
  void initState() {
    super.initState();
    date = DateFormat.MMMMEEEEd().format(now);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeApi.getRecipe(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CustomCircularProgressIndicator();
          default:
            print(snapshot.data);
            if (snapshot.data != null) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Typicons.th_menu,
                            color: Colors.white,
                            size: 25,
                          ),
                          onPressed: () => print('opening drawer ...'),
                        ),
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            AppImagesAssets.homePersonPath,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Text(
                        date,
                        style: AppTextStyles.homeDateTextStyle,
                      ),
                    ),
                    SizedBox(height: 10),
                    SearchField(),
                    BodyTitle(),
                    Text(snapshot.data.toString()),
                  ],
                ),
              );
            } else {
              return Text(
                'error with receiving data from api = ${snapshot.data}',
                style: AppTextStyles.homeTitleTextStyle,
              );
            }
        }
      },
    );
  }
}
