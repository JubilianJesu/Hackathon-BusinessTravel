import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dstore/dstore.dart';
import 'eventPage.dart';
import 'order/tripSummary.dart';
import 'orderDetails.dart';
import 'landingPage.dart';
import 'tagPage.dart';
import 'Preferences/preference.dart';
import 'order/flightSearch.dart';
import 'order/FlightResults.dart';
import 'login/login.dart';
import 'offers/offers_view.dart';
import 'events/events_scroller.dart';
import 'dstore/dStoreList.dart';
import 'order/Confirmation.dart';
import 'order/RentalWheelChair.dart';
import 'destination/destination.dart';
import 'deals/deals_scroller.dart';
import 'order/FlightShopRequest.dart';
import 'GlobalSSRIDConfirmation.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  final routes =  <String, WidgetBuilder> {
        LandingPage.tag : (BuildContext context) => new LandingPage(),
        OrderDetails.tag: (BuildContext context) => new OrderDetails(),
        MyPreferences.tag : (BuildContext context) => new MyPreferences(),
        TagPage.tag : (BuildContext context) => new TagPage(),
        EventListPage.tag: (BuildContext context) => new EventListPage(),
        SearchScreen.tag: (BuildContext context) => new SearchScreen(),
        FlightResultsScreen.tag: (BuildContext context) => new FlightResultsScreen(new FlightShopRequest()),
        TripSummary.tag: (BuildContext context) => new TripSummary(),
        LoginPage.tag: (BuildContext context) => new LoginPage(),
        MyOffers.tag: (BuildContext context) => new MyOffers(),
        MyEvents.tag: (BuildContext context) => new MyEvents(),
        DStorePage.tag : (BuildContext context) => new DStorePage(),
        RentalWC.tag: (BuildContext context) => new RentalWC(),
        Confirmation.tag: (BuildContext context) => new Confirmation(),
        MyDestinations.tag: (BuildContext context) => new MyDestinations(),
        MyDeals.tag: (BuildContext context) => new MyDeals(),
        MySpace.tag: (BuildContext context) => new MySpace(),
        GlobalSSRIdConfirmation.tag:(BuildContext context) => new GlobalSSRIdConfirmation(),
        };

  @override
  Widget build(BuildContext context){
    return MaterialApp( 
      title: "Business Travel",    
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch:Colors.deepPurple,

    ),
    routes: routes,
    home: LoginPage(),
    );
  }
}