import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './welcome_bloc.dart';
import './pages/page.dart';
import './pages/page2.dart';
import './pages/login.dart';

class ViewerWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final WelcomeBloc _welcome = Provider.of<WelcomeBloc>(context);

    return PageView(
      children: <Widget>[
        Page1(),
        Page2(),
        Login(),
      ],
      onPageChanged: (page) {
        _welcome.currentPage = page + 1;
      },
      controller: _welcome.controller,
    );
  }
}
