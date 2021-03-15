import 'dart:async';

import 'package:flutter/material.dart';

class FastScreen extends StatefulWidget {
  const FastScreen({Key key}) : super(key: key);

  @override
  _FastScreenState createState() => _FastScreenState();
}

class _FastScreenState extends State<FastScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (time) {
      time.cancel();
      Navigator.pushReplacementNamed(context, 'OpenScreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white),
    );
  }
}
