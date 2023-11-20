import 'package:app/modules/bottomTab/bottomTabScreen.dart';
import 'package:app/modules/login/sign_up_Screen.dart';
import 'package:flutter/material.dart';
import 'package:app/routes/routes.dart';
import 'package:app/modules/login/login_Screen.dart';

import '../modules/login/forgot_password.dart';


class NavigationServices {
  NavigationServices(this.context);

  final BuildContext context;

  Future<dynamic> _pushMaterialPageRoute(Widget widget,
      {bool fullscreenDialog = false}) async {
    return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  void gotoSplashScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.Splash, (Route<dynamic> route) => false);
  }

  void gotoIntroductionScreen() {
    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.IntroductionScreen, (Route<dynamic> route) => false);
  }

  Future<dynamic> gotoLoginScreen() async {
    return await _pushMaterialPageRoute(LoginScreen());
  }

  Future<dynamic> gotoForgotPasswordScreen() async{
    return await _pushMaterialPageRoute(ForgotPassword());
  }

  Future<dynamic> gotoSingUpScreen() async{
    return await _pushMaterialPageRoute(SingUpScreen());
  }

  Future<dynamic> gotoBottomTabScreen() async{
    return await _pushMaterialPageRoute(BottomTabScreen());
  }

}
