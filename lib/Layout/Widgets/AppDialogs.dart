import 'dart:math';
import 'package:flutter/material.dart';

AlertDialog winDialog(BuildContext context, Map<String, Color> theme) {
  Map<String, Color> _theme = theme;
  return AlertDialog(
    backgroundColor: _theme['Background Color'],
    content: Container(
      width: 200,
      height: 200,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                      'Dialog_Images/Win ${Random().nextInt(3) + 1}.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text(
            'Win',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: _theme['Color 2'],
            ),
          ),
        ],
      ),
    ),
    actions: [
      SizedBox(
        height: 40,
        width: 80,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: _theme['Color 2'],
          onPressed: () => Navigator.pop(context),
          child: Center(
            child: Text(
              'OK',
              style: TextStyle(
                color: _theme['Background Color'],
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

AlertDialog loseDialog(BuildContext context, Map<String, Color> theme) {
  Map<String, Color> _theme = theme;
  return AlertDialog(
    backgroundColor: _theme['Background Color'],
    content: Container(
      width: 200,
      height: 250,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 120,
              height: 120,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                      'Dialog_Images/Lose ${Random().nextInt(3) + 1}.png'),
                ),
              ),
            ),
          ),
          Text(
            'Ooops !\nTime is up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w900,
              color: _theme['Color 2'],
            ),
          ),
        ],
      ),
    ),
    actions: [
      SizedBox(
        height: 40,
        width: 80,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: _theme['Color 2'],
          onPressed: () => Navigator.pop(context),
          child: Center(
            child: Text(
              'OK',
              style: TextStyle(
                color: _theme['Background Color'],
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

AlertDialog indicatorDialog = AlertDialog(
  content: Container(
    width: 200,
    height: 200,
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ),
);
