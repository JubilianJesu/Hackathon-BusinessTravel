import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OrderDetails extends StatelessWidget {
static String tag="order-Page";
  @override
  Widget build(BuildContext context) {
    return new Scaffold( // 1
      appBar: new AppBar(
        title: new Text("Order Details"), // screen title

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              button1(context);
            } ,child: new Text("Prefernce"),)
          ],
        ),
      ) ,
    );
  }
}

void button1(BuildContext context){
  print("Button 1");
  Navigator.of(context).pushNamed('/Preferences');
}
