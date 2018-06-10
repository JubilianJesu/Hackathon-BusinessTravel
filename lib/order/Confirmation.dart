import 'package:flutter/material.dart';
import '../landingPage.dart';

class Confirmation extends StatefulWidget {
  static String tag = "confirmation-Page";
  @override
  State createState() => new ConfirmationState();
}

class ConfirmationState extends State<Confirmation> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            print('Menu button pressed');
            Navigator.of(context).pushNamed(LandingPage.tag);
          },
        ),
        title: new Text(
          'Confirmation',
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                  margin: const EdgeInsets.only(top: 50.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 25.0,
                    ),
                  ),
                  new Container(
                    child: new Text("Successfuly booked!", style: new TextStyle(fontSize: 20.0),),
                  )
                ],
              )),
              new Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: new Text("Your One Order Confirmation Id", style: new TextStyle(fontSize: 17.0),),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new Text("AX123N", style: new TextStyle(fontSize: 38.0),),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: new Image.asset("assets/qr_code.png", height: 200.0,),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: new Text(
                    "An email with itinerary details has been sent to ashish.negi@tcs.com.", style: new TextStyle(fontSize: 19.0) ,textAlign: TextAlign.center,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
