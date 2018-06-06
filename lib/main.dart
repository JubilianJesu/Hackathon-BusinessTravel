import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'eventPage.dart';
import 'orderDetails.dart';
import 'landingPage.dart';
import 'tagPage.dart';
import 'Preferences/preference.dart';
import 'order/flightSearch.dart';
import 'order/FlightResults.dart';
import 'login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  final routes =  <String, WidgetBuilder> {
        LandingPage.tag : (BuildContext context) => new LandingPage(),
        OrderDetails.tag: (BuildContext context) => new OrderDetails(),
        MyPreferences.tag : (BuildContext context) => new MyPreferences(),
        TagPage.tag : (BuildContext context) => new TagPage(),
        EventListPage.tag: (BuildContext context) => new EventListPage(),
        SearchScreen.tag: (BuildContext context) => new SearchScreen(),
        FlightResultsScreen.tag: (BuildContext context) => new FlightResultsScreen(),
        LoginPage.tag: (BuildContext context) => new LoginPage()
        };

  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      title: "Business Travel",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.lightBlue ,
    ),
    routes: routes,
    home: LandingPage(),
    );
  }
}