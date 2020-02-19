import 'package:flutter/material.dart';

class MyNewDeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Image.asset(
            "assets/BT01mydeals_.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
        )),
    );
  }
}