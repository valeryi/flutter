import 'package:flutter/material.dart';

Widget WelcomeHeader = Positioned(
  right: 30.0,
  top: 20.0,
  child: Container(
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            print('Skipped...');
          },
          child: Container(
            child: Text(
              'SKIP',
              style: TextStyle(
                  fontSize: 18.0,
                  letterSpacing: 2.0,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  ),
);
