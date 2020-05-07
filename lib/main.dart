import 'package:flutter/material.dart';
import 'package:ui_flutter/routing.dart';

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

// void main() {
//   StreamController<int> streamController = StreamController<int>();
//   StreamController<String> anotherController = StreamController<String>();

//   Stream intStream = streamController.stream;
//   Stream stringStream = anotherController.stream;

  // Stream combined =
  //     Rx.combineLatest2(intStream, stringStream, (intStream, stringStream) {
  //   return [intStream, stringStream];
  // });

  // Stream combined = Rx.combineLatest([intStream, stringStream], (value) {
  //   return value;
  // });

//   // Stream combined = ZipStream([intStream, stringStream], (value) {
//   //   return value;
//   // });

//   Stream combined = Rx.merge([intStream, stringStream]);

//   combined.listen((value) {
//     print(value);
//   });

//   streamController.sink.add(1);
//   anotherController.sink.add('a');
//   streamController.sink.add(2);
//   streamController.sink.add(3);
//   streamController.sink.add(7);
//   streamController.sink.add(8);
//   anotherController.sink.add('b');
//   anotherController.sink.add('c');


//   Future.delayed(Duration(seconds: 2), () {
//     streamController.add(4);

//     streamController.close();
//   });

//   streamController.sink.add(5);
//   streamController.sink.add(6);
//   streamController.sink.add(7);
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
