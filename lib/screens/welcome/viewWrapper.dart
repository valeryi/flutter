import 'package:flutter/material.dart';
import '../../blocs/welcome_bloc.dart';
import './pages/page.dart';
import './pages/page2.dart';
import './pages/login.dart';

class ViewerWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: welcomeBloc.combined,
        initialData: welcomeBloc.initialState(),
        builder: (context, AsyncSnapshot snapshot) {
          return PageView(
            children: <Widget>[
              Page1(),
              Page2(),
              Login(),
            ],
            onPageChanged: (page) {
              welcomeBloc.updatePage(page);
              // print(snapshot.data);
              // welcomeBloc.updatePage(page + 1);
            },
            // controller: snapshot.data.getController,
          );
        });
  }
}
