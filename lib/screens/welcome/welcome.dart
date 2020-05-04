import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:ui_flutter/screens/welcome/welcome_bloc.dart';
import './footer.dart';
import './viewWrapper.dart';
import './header.dart';
// import 'package:ui_flutter/routing.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  WelcomeBloc _welcomeBloc;

  @override
  Widget build(BuildContext context) {
    final WelcomeBloc _welcome = Provider.of<WelcomeBloc>(context);
    this._welcomeBloc = _welcome;
    print('Welcome: _welcome.currentPage - ${this._welcomeBloc.lastPage}');

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ViewerWrapper(),
            Footer(
              currentStep: _welcomeBloc.currentPage,
              totalSteps: 3,
              activeColor: Colors.grey[800],
              inactiveColor: Colors.grey[100],
            ),
            WelcomeHeader,
          ],
        ),
      ),
    );
  }
}
