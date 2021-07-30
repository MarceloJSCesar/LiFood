import 'dart:ui';

import 'package:flutter/material.dart';
import '../../../app/config/app_textstyles.dart';
import '../../../app/config/app_routes_name.dart';
import '../../../app/config/app_image_assets.dart';
import '../../../app/components/auth/auth_field.dart';
import '../../../app/components/auth/auth_button.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                AppImagesAssets.splashImagePath,
              ),
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 05.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        'Sign Up',
                        style: AppTextStyles.authTitleTextStyle,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              AuthField(
                                label: 'Name',
                                isEmail: false,
                                isPassword: false,
                                controller: _nameController,
                              ),
                              AuthField(
                                label: 'Email',
                                isEmail: true,
                                isPassword: false,
                                controller: _emailController,
                              ),
                              AuthField(
                                label: 'Password',
                                isEmail: false,
                                isPassword: true,
                                controller: _passwordController,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.of(context).pushReplacementNamed(
                                  AppRoutesNames.toLoginRoute,
                                ),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Already have an account',
                                    style: AppTextStyles.authBottomTextStyle,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              AuthButton(
                                text: 'Sign Up',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '© 2021 Powered by LiFood',
                          style: AppTextStyles.authBottomTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
