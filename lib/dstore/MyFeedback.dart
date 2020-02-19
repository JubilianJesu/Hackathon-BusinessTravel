import 'package:flutter/material.dart';

class MyFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Image.asset(
            "assets/BT04myfeedback.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
        )),
    );
  }
}
