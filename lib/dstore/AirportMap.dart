import 'package:flutter/material.dart';

class AirportMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new Image.asset(
            "assets/SEA_overview_map.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
        )),
    );
  }
}