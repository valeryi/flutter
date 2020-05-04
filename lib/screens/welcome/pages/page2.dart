import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Page 2',
              style: TextStyle(
                fontSize: 25.0,
              ),
              )
          ],
        ),
      ),
    );
  }
}
