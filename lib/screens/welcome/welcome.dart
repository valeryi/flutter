import 'package:flutter/material.dart';
import 'package:ui_flutter/blocs/welcome_bloc.dart';
import './footer.dart';
import './viewWrapper.dart';
import './header.dart';
// import 'package:ui_flutter/routing.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  void dispose() {
    super.dispose();
    // welcomeBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    // print(
    //     'Welcome: _welcome.currentPage - ${welcomeBloc.currentPage.listen((page) => print(page))}');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: welcomeBloc.combined,
        builder: (context, AsyncSnapshot snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  ViewerWrapper(),
                  Footer(
                    currentStep: 1,
                    totalSteps: 3,
                    activeColor: Colors.grey[800],
                    inactiveColor: Colors.grey[100],
                  ),
                  WelcomeHeader,
                ],
              ),
            ),
          );
        });
  }
}
