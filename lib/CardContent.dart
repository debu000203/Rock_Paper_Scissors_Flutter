import 'package:flutter/material.dart';

const kTextStyle = TextStyle(color: Colors.black, fontSize: 40.0);

class CardContent extends StatelessWidget {
  final String title;
  final Function function;
  CardContent({this.title, this.function});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: function,
      child: Card(
        margin: EdgeInsets.all(10.0),
        color: Colors.blueGrey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: kTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
