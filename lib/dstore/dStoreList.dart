import 'package:flutter/material.dart';
import 'dart:ui';

class DStorePage extends StatefulWidget {
  static String tag = "MyGrid";
  DStorePageState createState() => DStorePageState();
}

class DStorePageState extends State<DStorePage> {  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: (){
                print('Menu button');
              },
            ),
          title: new Text("D Store")
        ),
        body:  new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("assets/background.jpg", fit: BoxFit.cover),
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Container(
              color: Colors.black.withOpacity(0.3),
              child: TheGridView().build(),
            ),
          ),
        ],
        ),
      ),
    );
  }
}


class TheGridView {
  GestureDetector makeGridCell(String name,String title,  String image, int notificationCount) {
    return new GestureDetector(
  onTap:(){print("clicked$name");},
  child: new Card(
      elevation: 1.0,
      child: new ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
        child: new Stack(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
            new Image.asset("assets/$image", fit: BoxFit.cover,),
               Center(child: Text("$title", style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0),)),
        ],
            ),
          ),
          new Positioned(
            bottom: 90.0,
            right: 8.0,
            child: _buildNotification(notificationCount),
          ),
        ],
      ),
    ),
    ),
    );
  }

Widget _buildNotification(noOfNotification) {
    return new Material(
      color: Colors.red,
      type: MaterialType.circle,
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text("$noOfNotification", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),)/*new Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),   */     
        ),

    );
  }

  GridView build() {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          makeGridCell("Room Upgrade","Room Upgrade","HotelUpgrade.jpg",5),
          makeGridCell("Hotel Booking","Hotel Booking", "HotelBooking.jpg",3),
          makeGridCell("Upsell","Upsell","Upsell.jpg",3),
          makeGridCell("Taxi","Taxi","carbooking.jpg",8),
        ]);
  }
}