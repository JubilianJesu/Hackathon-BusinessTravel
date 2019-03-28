import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'dstore/dstore.dart';
import 'events/events_scroller.dart';
import 'events/events_view.dart';
import 'Offers/Offers_view.dart';
import 'order/FlightCommonComponent.dart';
import 'order/tripSummary.dart';
import 'package:url_launcher/url_launcher.dart';

class TagPage extends StatefulWidget {
  static String tag = "Tag-Page";
  @override
  State<StatefulWidget> createState() {
    return new TagPageState();
  }
}

class TagPageState extends State<TagPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      primaryColor: Colors.grey[850],
      fontFamily: 'Whitney'

    ),
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('Menu button');
                },
              ),
              actions: <Widget>[IconButton(
                icon: Icon(Icons.my_location),
                onPressed: () {
                   Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MySpace()));                  
                },
              ),],
              backgroundColor: Colors.grey[800],
              title: new Text("TAG")),
          body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
        child: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
      new Container(
        //height: 400.0,
        child: buildTravelCart(),
      ),
      new Container(
        height: 400.0,
        child: TheGridView().build(context),
      ),
    ]));
  }

  Widget buildTravelCart() {
    return new ClipRRect(
      borderRadius: new BorderRadius.circular(8.0),
      child: new Stack(
        children: <Widget>[
          //new Image.asset('assets/washingtonmonument.jpg',fit: BoxFit.cover),
          new Positioned(
            child: buildTravelDetails(),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(top: 150.0, bottom: 10.0),
                  child: new Text(
                    "Flight Status",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(
                      top: 150.0, right: 5.0, bottom: 10.0),
                  child: new Text(
                    "Ontime",
                    style: new TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  FlightCommonComponent component = new FlightCommonComponent();
  TripSummaryState tripSummary = new TripSummaryState();
  Widget buildTravelDetails() {
    var flights = component.getDummySelectedFlights();
    List<Widget> widTrips = new List<Widget>();
    for (var i = 0; i < flights.length; i++) {
      widTrips.add(tripSummary.buildTripForSummary(context, flights[i]));
    }
    return new Container(
      child: new Column(
        children: widTrips,
      ),
    );
  }
}

class TheGridView {
  GestureDetector makeGridCell(BuildContext context,
      String name, String title, String image, int notificationCount) {
    return new GestureDetector(
      onTap: () {
        iconClick(context,name);
      },
      child: new Card(
        elevation: 1.0,
        child: new ClipRRect(
          borderRadius: new BorderRadius.circular(8.0),
          child: new Stack(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    new Image.asset(
                      "assets/$image",
                      fit: BoxFit.cover,
                      height: 120.0,
                    ),
                    Center(
                        child: Text(
                      "$title",
                      style: new TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView build(BuildContext context) {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(4.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          makeGridCell(context,"AirportMap", "Airport Map", "airporttile.png", 5),
          makeGridCell(context,"Weather", "Weather", "Weather.png", 5),
          makeGridCell(context,"Events", "Events", "Event_2.jpg", 3),
          makeGridCell(context,"Local Destinations", "Locale", "attractions.jpg", 3),
          makeGridCell(context,"Wine&Dine", "Wine&Dine", "Wine&Dine.gif", 8)
        ]);
  }
}

void iconClick(BuildContext context, String icon) {
  switch (icon) {
    case "AirportMap":
      launch("https://www.google.com/maps/place/Denver+International+Airport/@39.8560963,-104.6759263,17z/data=!3m1!4b1!4m5!3m4!1s0x876c7f2a98ff44ff:0x49583bb435b59c6a!8m2!3d39.8560963!4d-104.6737376");
      break;
    case "Weather":
      launch("https://weather.com/weather/hourbyhour/l/Denver+CO+USCO0105:1:US");
      break;
    case "Wine&Dine":
      launch("https://www.google.com/maps/search/restaurants+near+me/@38.9001876,-77.0276488,15z/data=!3m1!4b1");
      break;
    case "Local Destinations":
      launch("https://www.google.com/maps/search/attractions+near+me/@38.9001883,-77.0276488,15z/data=!3m1!4b1");
      break;
    default:
      Navigator.of(context).pushNamed(MyEvents.tag);
      break;
  }
}
