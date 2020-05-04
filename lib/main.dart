import 'package:flutter/material.dart';
import 'package:ui_flutter/routing.dart';
import 'package:provider/provider.dart';
import 'screens/welcome/welcome_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WelcomeBloc()),
      ],
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
