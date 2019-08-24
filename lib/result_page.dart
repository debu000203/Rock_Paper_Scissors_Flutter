import 'dart:io';

import 'package:flutter/material.dart';

import 'CardContent.dart';

class ResultPage extends StatelessWidget {
  final int userScores;
  final int compScore;
  String text;
  ResultPage({this.userScores, this.compScore}) {
    print(userScores);
    print(compScore);
    if (userScores > compScore) {
      text = 'You Win';
    } else if (userScores < compScore) {
      text = 'YOU LOST';
    } else
      text = 'DRAW';
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Colors.grey,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 50.0),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                CardContent(
                  title: 'Play Again',
                  function: () {
                    Navigator.pop(context);
                  },
                ),
                CardContent(
                  title: 'Exit',
                  function: () {
                    exit(0);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
