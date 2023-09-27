import 'package:flutter/material.dart';
import 'package:optilife/features/home/home_screen.dart';
import 'package:optilife/features/signin/signin_screen.dart';
import 'package:optilife/features/signup/signup_screen.dart';
import '../../features/user_info/user_info_screen.dart';

const String home = 'home';
const String getStarted = 'getStarted';
const String mainPage = 'mainPage';
const String signIn = 'signIn';
const String signUp = 'signUp';
const String userInfo = 'userInfo';


Route<dynamic> controller(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case signIn:
      return MaterialPageRoute(builder: (context) =>  const SigninScreen());
    case signUp:
      return MaterialPageRoute(builder: (context) =>  SignupScreen());
    case userInfo:
      return MaterialPageRoute(builder: (context) => const UserInfoScreen());

    default:
      throw ('This route name does not exit');
  }
}
