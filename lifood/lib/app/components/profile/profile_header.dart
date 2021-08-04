import 'package:flutter/material.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/config/app_textstyles.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  const ProfileHeader({
    Key key,
    @required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 175,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://png.pngtree.com/thumb_back/fh260/background/20200714/pngtree-modern-double-color-futuristic-neon-background-image_351866.jpg'),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.settings),
                    iconSize: 25,
                    onPressed: () => print('opening settings'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      AppImagesAssets.homePersonPath,
                    ),
                  ),
                  Text(
                    userName,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.profileNameTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
