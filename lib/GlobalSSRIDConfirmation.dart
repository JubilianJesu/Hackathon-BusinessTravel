import 'package:flutter/material.dart';
import 'order/flightSearch.dart';
import 'landingPage.dart';

class GlobalSSRIdConfirmation extends StatefulWidget {
  static String tag = "globalSSRIdConfirmation-Page";
  @override
  State createState() => new GlobalSSRIdConfirmationState();
}

class GlobalSSRIdConfirmationState extends State<GlobalSSRIdConfirmation> {
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
                    child: new Text("Global SSR ID - created successfully", style: new TextStyle(fontSize: 20.0),),
                  )
                ],
              )),
              new Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: new Text("Your Gloabl SSR Id", style: new TextStyle(fontSize: 17.0),),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: new Text("GSSR1234567890", style: new TextStyle(fontSize: 38.0),),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: new Image.asset("assets/qr_code.png", height: 200.0,),
              ),
              new Container(
                margin: const EdgeInsets.only(top: 50.0),
                child: new Text(
                    "An email with SSR ID and QR has been sent to ashish.negi@tcs.com.", style: new TextStyle(fontSize: 19.0) ,textAlign: TextAlign.center,),
              ),
            ],
          )
        ],
      ),
    );
  }
}
