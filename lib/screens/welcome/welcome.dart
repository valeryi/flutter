import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ui_flutter/model/app_state.dart';
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
  // WelcomeBloc _welcomeBloc;

  @override
  Widget build(BuildContext context) {
    // print('Welcome: _welcome.currentPage - ${this._welcomeBloc.lastPage}');

    return Scaffold(
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return SafeArea(
            child: Stack(
              children: <Widget>[
                ViewerWrapper(),
                Footer(
                  currentStep: state.currentPage,
                  totalSteps: 3,
                  activeColor: Colors.grey[800],
                  inactiveColor: Colors.grey[100],
                ),
                WelcomeHeader,
              ],
            ),
          );
        },
      ),
    );
  }
}
