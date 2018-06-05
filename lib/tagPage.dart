import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'eventPage.dart';


class TagPage extends StatefulWidget {
  static String tag="Tag-Page";
  @override
 State<StatefulWidget> createState() {
    return new TagPageState();
  }
 
}
class TagPageState extends State<TagPage>{
   
  
 @override
  Widget build(BuildContext context) {
       final logoHeader = Hero(
        tag: "tcsLogo",
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 50.0, child: Image.asset('assets/logo.png'),
        ),
      );

      final eventsButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 50.0,
              height: 42.0,
              onPressed: (){
                Navigator.of(context).pushNamed(EventListPage.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Events', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final destinationButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 50.0,
              height: 42.0,
              onPressed: (){},
              color: Colors.lightBlueAccent,
              child: Text('Destinations', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final oneOrderButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 50.0,
              height: 42.0,
              onPressed: (){},
              color: Colors.lightBlueAccent,
              child: Text('One Order', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final wineAndDineButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 50.0,
              height: 42.0,
              onPressed: (){},
              color: Colors.lightBlueAccent,
              child: Text('Wine & Dine', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final blendButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 50.0,
              height: 42.0,
              onPressed: (){},
              color: Colors.lightBlueAccent,
              child: Text('Blend', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );


    var listView = new ListView();
    var drawer = new Drawer();
    return new Scaffold( // 1
    drawer: drawer,
      appBar: new AppBar(
      title: new Text("Business Travel Supporting System"), // screen title,
      actions: <Widget>[
      logoHeader
    ],
      ),
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right:24.0),
        children: <Widget>[
          eventsButton,
          SizedBox(height: 20.0),
          destinationButton,
          SizedBox(height: 20.0),
          oneOrderButton,
          SizedBox(height: 20.0),
          wineAndDineButton,
          SizedBox(height: 20.0),
          blendButton,
          SizedBox(height: 5.0),
           new ListTile(
              leading: new Icon(Icons.airport_shuttle),
              title: new Text('Gates'),
            ),
          new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Airport Map'),
            ),
           
            new ListTile(
              leading: new Icon(Icons.flight_takeoff),
              title: new Text('Flight Status'),
            ),
        ],
      )
    ),
    );
  }
}
void orderDetailsClick(BuildContext context){
  Navigator.of(context).pushNamed('/OrderDetails');
}
