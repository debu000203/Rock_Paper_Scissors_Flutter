import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rps/CardContent.dart';

import 'play_page.dart';
import 'rules.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CardContent(
              title: 'Play',
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PlayPage();
                    },
                  ),
                );
              },
            ),
            CardContent(
              title: 'Rules',
              function: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Rules();
                }));
              },
            ),
            CardContent(
              title: 'Exit',
              function: () {
                exit(0);
              },
            )
          ],
        ),
      ),
    );
  }
}
