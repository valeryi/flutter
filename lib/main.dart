import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:ui_flutter/model/app_state.dart';
import 'package:ui_flutter/routing.dart';
import 'screens/welcome/welcome_bloc.dart';
import 'package:ui_flutter/redux/reducers.dart';
// import 'package:redux/redux.dart';

void main() {
  final _initialState = AppState(currentPage: 1, lastPage: false);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/welcome',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
