import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../deals/deals_scroller.dart';
import '../events/events_scroller.dart';
import '../order/FlightCommonComponent.dart';
import '../order/tripSummary.dart';
import 'package:url_launcher/url_launcher.dart';
import 'MyAirlines.dart';
import 'MyHotel.dart';
import 'MyNewDeal.dart';
import 'MyFeedback.dart';

class MySpace extends StatefulWidget {
  static String tag = "MySpace-Page";
  final String eventnavig = "";
  @override
  State<StatefulWidget> createState() {
    return new MySpacePageState();
  }
}

class MySpacePageState extends State<MySpace> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  print('Menu button');
                },
              ),
              backgroundColor: Colors.deepPurpleAccent,
              title: new Text("My Wallet")),
          body: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return new Container(
        child: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
      // new Container(
      //   //height: 400.0,
      //   child: buildTravelCart(),
      // ),
      new Container(
        height: 600.0,
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
                    new Center(
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
          makeGridCell(context,"Delta", "", "delta.png", 5),
          makeGridCell(context,"Hilton", "", "hilton.png", 5),          
          makeGridCell(context,"Deals", "", "MyDeals.jpg", 5),
          makeGridCell(context,"Budget", "", "budget.png", 3),
          makeGridCell(context,"Uber", "", "uber.jpg", 3),
         // makeGridCell(context,"Attractions", "", "attractions.jpg", 3),
        ]);
  }
}

void iconClick(BuildContext context, String icon) {
    switch (icon) {
    case "Delta":
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyAirline()));      
      break;
    case "Hilton":
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHotel()));
      break;
    case "Uber":     
      launch("https://www.uber.com/");          
      break;
    case "Budget":
      launch("https://www.budget.com/en/home");
      break;
    case "Deals":
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyNewDeal()));
      break;   
    default:
      Navigator.of(context).pushNamed(MySpace.tag);  
  }
}
