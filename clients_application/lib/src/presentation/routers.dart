import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/about_weather/about_weather_screen.dart';
import 'package:flutter_app/src/presentation/chat_detail/chat_detail_screem.dart';
import 'package:flutter_app/src/presentation/chats/chat_list_screen.dart';
import 'package:flutter_app/src/presentation/get_started/get_started.dart';
import 'package:flutter_app/src/presentation/home/home_screen.dart';
import 'package:flutter_app/src/presentation/login/login_screen.dart';
import 'package:flutter_app/src/presentation/onboarding/onboarding.dart';
import 'package:flutter_app/src/presentation/register/register_screen.dart';

import 'navigation/navigation_screen.dart';

class Routers {
  static const String navigation = "/navigation";
  static const String about = "/about";
  static const String getStarted = "/get-started";
  static const String login = "/login";
  static const String register = "/register";
  static const String home = "/home";
  static const String onboarding = "/onboarding";
  static const String chatDetail = "/chat-detail";
  static const String chats = "/chats";
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var arguments = settings.arguments;
    switch (settings.name) {
      case navigation:
        return animRoute(NavigationScreen(), name: navigation);
      case about:
        return animRoute(AboutWeatherScreen(), name: about);
      case login:
        return animRoute(LoginScreen(), name: login);
      case getStarted:
        return animRoute(GetStartedScreen(), name: getStarted);
      case register:
        return animRoute(RegisterScreen(), name: register);
      case home:
        return animRoute(HomeScreen(), name: home);
      case onboarding:
        return animRoute(OnboardingScreen(), name: onboarding);
      case chats:
        return animRoute(ChatListScreen(), name: chats);
      case chatDetail:
        return animRoute(ChatDetailScreen(), name: chatDetail);

      //
      default:
        return animRoute(
            Container(
                child: Center(
                    child: Text('No route defined for ${settings.name}'))),
            name: "/error");
    }
  }

  static Route animRoute(Widget page,
      {Offset? beginOffset, required String name, Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset _center = Offset(0.0, 0.0);
  static Offset _top = Offset(0.0, 1.0);
  static Offset _bottom = Offset(0.0, -1.0);
  static Offset _left = Offset(-1.0, 0.0);
  static Offset _right = Offset(1.0, 0.0);
}
