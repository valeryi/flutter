import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
// import 'package:provider/provider.dart';
// import './welcome_bloc.dart';
import './pages/page.dart';
import './pages/page2.dart';
import './pages/login.dart';
import 'package:ui_flutter/redux/actions.dart';
import 'package:ui_flutter/model/app_state.dart';

class ViewerWrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        return PageView(
          children: <Widget>[
            Page1(),
            Page2(),
            Login(),
          ],
          onPageChanged: (page) {
            int currentPage = page + 1;
            StoreProvider.of<AppState>(context).dispatch(CurrentPageAction(currentPage: currentPage));
          },
          controller: state.pageController,
        );
      },
    );
  }
}
