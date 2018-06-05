import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Preferences extends StatelessWidget {
static String tag="preference-Page";
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Prefernces"),

      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(onPressed:(){
              button2(context);
            } ,child: new Text("Home"),)
          ],
        ),
      ) ,
    );

  }
}

void button2(BuildContext context){
  print("Button 2");
  Navigator.of(context).pushNamed('/landing');
}