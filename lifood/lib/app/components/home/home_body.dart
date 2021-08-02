import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:lifood/app/components/home/widgets/body_title.dart';
import 'package:lifood/app/components/home/widgets/categories_button.dart';
import 'package:lifood/app/components/home/widgets/header_body.dart';
import 'package:lifood/app/components/home/widgets/recipe_card.dart';
import 'package:lifood/app/components/home/widgets/search_field.dart';
import 'package:lifood/app/components/home/widgets/section_body.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/home/home_controller.dart';
import 'package:lifood/app/services/home/home_service.dart';

import 'package:typicons_flutter/typicons_flutter.dart';
import '../../../app/config/app_image_assets.dart';
import '../custom_circular_progress_indicator.dart';

class HomeBody extends StatefulWidget {
  final Function changeValue;
  const HomeBody({
    Key key,
    this.changeValue,
  }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _homeService = HomeService();
  final DateTime now = DateTime.now();
  final videoUrlist = [
    'https://player.vimeo.com/external/271611326.sd.mp4?s=3c5d20003a97a14d38832283944cc78da3d60082&profile_id=164&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/121182415.mobile.mp4?s=8d86d2cb32fc7f68b26ed710b88b4ed68bc13ddd&profile_id=116&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/360964140.sd.mp4?s=931b7c068f4c78bd97ea6d1b4e29c89ff3e856ab&profile_id=139&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/372334127.sd.mp4?s=bd520edd093d7bb82c2a8a8967b16da32682717d&profile_id=139&oauth2_token_id=57447761',
    'https://player.vimeo.com/external/406525280.sd.mp4?s=f106de57b007210706710b0a32a208c10c9c8fc2&profile_id=139&oauth2_token_id=57447761'
  ];
  var date;
  @override
  void initState() {
    super.initState();
    date = DateFormat.MMMMEEEEd().format(now);
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => widget.changeValue(),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, top: 10),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    AppImagesAssets.homePersonPath,
                  ),
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
          SizedBox(height: 20),
          // HeaderBody(),
          BodyTitle(
            text: 'Hot food trailer videos',
          ),
          /*
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: videoUrlist.length,
                itemBuilder: (context, i) {
                  return SectionBody(
                    videoUrl: videoUrlist[i],
                  );
                }),
          ),
          */
        ],
      ),
    );
  }
}
