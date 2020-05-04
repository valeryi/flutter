import 'package:flutter/material.dart';
import 'package:ui_flutter/screens/home/home.dart';
import 'package:ui_flutter/screens/welcome/welcome.dart';

// TODO: Improve Routing and Guarding

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return RouteGenerator.go(settings, Home());
        break;
      case '/welcome':
        return RouteGenerator.go(settings, Welcome());
        break;

      // Default fallout
      default:
        return RouteGenerator.go(settings, Error404());
        break;
    }
  }

  static MaterialPageRoute<void> go(RouteSettings settings, Widget route) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => route,
      fullscreenDialog: true,
    );
  }
}

class Error404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Error not found!',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
