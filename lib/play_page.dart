import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rps/icon_button.dart';

import 'result_page.dart';

enum rps { rock, paper, scissors }

class PlayPage extends StatefulWidget {
  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  int _userScore = 0;
  int _machineScore = 0;
  int _machinePicked = 1;
  int _userPicked = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePage();
  }

  void initializePage() {
    _userScore = 0;
    _machineScore = 0;
    _machinePicked = 1;
    _userPicked = 1;
  }

  void updateUI(var userChoice) {
    int val;
    for (int i = 0; i < 3; i++) {
      if (rps.values[i] == userChoice) {
        val = i;
      }
    }
    setState(() {
      _userPicked = val + 1;
      _machinePicked = Random().nextInt(3) + 1;

      var machineChoice = rps.values[_machinePicked - 1];
      if (machineChoice == userChoice) {
      } else if (userChoice == rps.rock) {
        machineChoice == rps.paper ? _machineScore++ : _userScore++;
      } else if (userChoice == rps.paper) {
        machineChoice == rps.scissors ? _machineScore++ : _userScore++;
      } else if (userChoice == rps.scissors) {
        machineChoice == rps.rock ? _machineScore++ : _userScore++;
      }
    });
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'User Score: $_userScore',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Machine Score: $_machineScore',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: width / 5,
                    backgroundImage: AssetImage('images/image$_userPicked.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: width / 5,
                    backgroundImage:
                        AssetImage('images/image$_machinePicked.png'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    updateUI(rps.rock);
                  },
                  child: IconButtton(
                    title: 'Rock',
                    image: 'images/image1.png',
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    updateUI(rps.paper);
                  },
                  child: IconButtton(
                    title: 'Paper',
                    image: 'images/image2.png',
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    updateUI(rps.scissors);
                  },
                  child: IconButtton(
                    title: 'Scissors',
                    image: 'images/image3.png',
                  ),
                ),
              ],
            ),
            FlatButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultPage(
                        userScores: _userScore,
                        compScore: _machineScore,
                      );
                    },
                  ),
                );
                setState(() {
                  initializePage();
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 35,
                    child: Center(
                      child: Text(
                        'End Game',
                        style: TextStyle(color: Colors.black, fontSize: 20.0),
                      ),
                    ),
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
