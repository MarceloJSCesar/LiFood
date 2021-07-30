import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lifood/app/components/auth/auth_button.dart';
import 'package:lifood/app/components/auth/auth_field.dart';
import 'package:lifood/app/config/app_image_assets.dart';
import 'package:lifood/app/config/app_routes_name.dart';
import 'package:lifood/app/config/app_textstyles.dart';
import 'package:lifood/app/controllers/auth/auth_controller.dart';
import 'package:lifood/app/services/auth/auth_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _authService = AuthService();
  final _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return SingleChildScrollView(
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
                          'Sign In',
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
                                  label: 'Email',
                                  isEmail: true,
                                  isPassword: false,
                                  controller: _emailController,
                                  isPasswordVisible:
                                      _authController.isPasswordVisible,
                                  changeVisiblePasswordValue: _authController
                                      .changeVisiblePasswordValue,
                                ),
                                AuthField(
                                  label: 'Password',
                                  isEmail: false,
                                  isPassword: true,
                                  isPasswordVisible:
                                      _authController.isPasswordVisible,
                                  controller: _passwordController,
                                  changeVisiblePasswordValue: _authController
                                      .changeVisiblePasswordValue,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    AppRoutesNames.toRegisterRoute,
                                  ),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'Don\'t have an account?',
                                      style: AppTextStyles.authBottomTextStyle,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                AuthButton(
                                  text: 'Sign In',
                                  isLoading: _authController.isLoading,
                                  onTap: () async {
                                    _authController.enableIsLoading();
                                    final user = await _authService.login(
                                      email: 'eve.holt@reqres.in',
                                      password: 'cityslicka',
                                    );
                                    print(user);
                                    _authController.disableIsLoading();
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                AuthButton(
                                  text: 'Logout',
                                  isLoading: _authController.isLoading,
                                  onTap: () async {
                                    _authController.enableIsLoading();
                                    await _authService.logout('TOKEN', 'NAME');
                                    _authController.disableIsLoading();
                                    print('tapped');
                                  },
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
        );
      }),
    );
  }
}
