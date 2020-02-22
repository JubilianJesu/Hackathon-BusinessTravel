import 'dart:io';

import 'package:flutter/material.dart';
import 'FlightResultsModel.dart';

class FlightCommonComponent{
    Widget buildTripDetails(BuildContext context, Flight flight){
    return new Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                       margin: const EdgeInsets.only(left: 8.0),
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                flight.departureTime,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            new Container(
                              child: new Text(flight.origin,
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(fontSize: 14.0)),
                            ),
                          ],
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(flight.travelTime),
                          ),
                          new Container(
                            width:150.0,
                            margin: const EdgeInsets.only(top: 9.8),
                            decoration: const BoxDecoration(
                                border: const Border(
                                    bottom: const BorderSide(
                                        width: 1.0, color: Colors.black87))),
                          ),
                          new Container(
                              child: new Row(
                            children: getFlightAmenities(flight.amenities, context),
                          ))
                        ],
                      ),
                      new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                flight.arrivalTime,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            new Container(
                              child: new Text(flight.destination,
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(fontSize: 14.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }
  
  List<Widget> buildAirlineWidget(BuildContext context, String carrierCode, int flightStats) {
    String _logoPath, operatorName, flightstat;
    flightstat = flightStats.toString();
    if (carrierCode == "aa") {
      operatorName = "American Airlines";
      _logoPath = "assets/AA_logo.png";
    }
    if (carrierCode == "ua") {
      operatorName = "United Airlines";
      _logoPath = "assets/United_logo.png";
    }
    if (carrierCode == "da") {
      operatorName = "Delta Airlines";
      _logoPath = "assets/Delta_logo.png";
    }
    if (carrierCode == "C9") {
      operatorName = "Delta Airlines";
      _logoPath = "assets/Delta_logo.png";
    }
    
    List<Widget> lstWidg = new List<Widget>();
    lstWidg.add(new Image.asset(
      _logoPath,
      height: 16.0,
    ));
    lstWidg.add(
      new Container(
        margin: const EdgeInsets.only(left: 3.0),
        child: new Text(
          operatorName,
          style: new TextStyle(fontSize: 16.0),
        )));
   /* if(flightStats >= 8) {
      lstWidg.add(
        new Container(
      margin: const EdgeInsets.only(left: 3.0),
     decoration: new BoxDecoration(
      borderRadius: new BorderRadius.circular(25.0),
      border: new Border.all(
        width: 5.0,
        color: Colors.green,
      )),
      child: new Text(
        flightstat,
        style: new TextStyle(fontSize: 16.0),
      )));
    }
    else if(flightStats >= 5 && flightStats < 8) {
     lstWidg.add(
        new Container(
      margin: const EdgeInsets.only(left: 3.0),
     decoration: new BoxDecoration(
      borderRadius: new BorderRadius.circular(25.0),
      border: new Border.all(
        width: 5.0,
        color: Colors.orange,
      )),
      child: new Text(
        flightstat,
        style: new TextStyle(fontSize: 16.0),
      )));
    }
    else if(flightStats < 5) {
      lstWidg.add(
        new Container(
      margin: const EdgeInsets.only(left: 3.0),
     decoration: new BoxDecoration(
      borderRadius: new BorderRadius.circular(25.0),
      border: new Border.all(
        width: 5.0,
        color: Colors.red,
      )),
      child: new Text(
        flightstat,
        style: new TextStyle(fontSize: 16.0),
      )));
    }*/
    return lstWidg;
  }

  List<Widget> getFlightAmenities(Amenities amenities, BuildContext context) {
    const _iconSize = 16.0;
    List<Widget> lstWidgets = new List<Widget>();
    if (amenities.isWifi) {
      lstWidgets.add(new Container(
          padding: const EdgeInsets.only(left: 2.0),
          child: const Icon(
            Icons.wifi,
            size: _iconSize,
          )));
    }
    if (amenities.isLegroom) {
      lstWidgets.add(new Container(
          padding: const EdgeInsets.only(left: 2.0),
          child: const Icon(
            Icons.airline_seat_legroom_extra,
            size: _iconSize,
          )));
    }
    if (amenities.isUSB) {
      lstWidgets.add(new Container(
          padding: const EdgeInsets.only(left: 2.0),
          child: const Icon(
            Icons.usb,
            size: _iconSize,
          )));
    }
    if (amenities.isOnDemandVideo) {
      lstWidgets.add(new Container(
          padding: const EdgeInsets.only(left: 2.0),
          child: const Icon(
            Icons.ondemand_video,
            size: _iconSize,
          )));
    }
    if (amenities.isOnDemandVideo && amenities.isLegroom) {
      lstWidgets.add(new Container(
          padding: const EdgeInsets.only(left: 2.0),
          child: const Icon(
            Icons.accessible,
            size: _iconSize,
          )));
    }
    return lstWidgets;
  }

  FlightResultsData getDummyFlightResults() {
    sleep(const Duration(seconds:3));
    FlightResultsData data = new FlightResultsData();
    FlightResults fResults = new FlightResults();
    fResults.trips = new List<TripInfo>();
    //--------------------Trip1---------------------------------------
    var trip1 = new TripInfo();
    trip1.trip = new List<Flight>();
    List<Flight> flts = new List<Flight>();
    
    //-------------------Flight 1-----------------------------
    Flight flt1 = new Flight();
    Amenities am1 = new Amenities();
    flt1.origin = "ORD";
    flt1.destination = "SEA";
    flt1.departureTime = "07:00am";
    flt1.arrivalTime = "09:35am";
    flt1.travelTime = "4h 35m";
    flt1.priceToCollect = "+ \$120";
    flt1.carrierCode = "da";
    flt1.isBestFlight = true;
    flt1.flightStats = 8;

    am1.isLegroom = true;
    am1.isOnDemandVideo = true;
    am1.isUSB = true;
    am1.isWifi = true;
    flt1.amenities = am1;

    flts.add(flt1);
    //-----------------------------------------------------------

    //-------------------Flight 2-----------------------------
    Flight flt2 = new Flight();
    Amenities am2 = new Amenities();
    flt2.origin = "ORD";
    flt2.destination = "SEA";
    flt2.departureTime = "02:31pm";
    flt2.arrivalTime = "05:08pm";
    flt2.travelTime = "4h 35m";
    flt2.priceToCollect = "+ \$120";
    flt2.carrierCode = "da";
    flt2.isBestFlight = true;
    flt2.flightStats = 8;

    am2.isLegroom = true;
    am2.isOnDemandVideo = false;
    am2.isUSB = true;
    am2.isWifi = true;
    flt2.amenities = am2;

    flts.add(flt2);
    //-----------------------------------------------------------

    //-------------------Flight 3-----------------------------
    Flight flt3 = new Flight();
    Amenities am3 = new Amenities();
    flt3.origin = "ORD";
    flt3.destination = "SEA";
    flt3.departureTime = "07:15am";
    flt3.arrivalTime = "10:00am";
    flt3.travelTime = "4h 45m";
    flt3.priceToCollect = "+ \$212";
    flt3.carrierCode = "da";
    flt3.isBestFlight = false;
    flt3.flightStats = 4;

    am3.isLegroom = false;
    am3.isOnDemandVideo = false;
    am3.isUSB = true;
    am3.isWifi = true;
    flt3.amenities = am3;

    flts.add(flt3);
    //-----------------------------------------------------------

    //-------------------Flight 4-----------------------------
    Flight flt4 = new Flight();
    Amenities am4 = new Amenities();
    flt4.origin = "ORD";
    flt4.destination = "SEA";
    flt4.departureTime = "08:00am";
    flt4.arrivalTime = "10:30am";
    flt4.travelTime = "4h 30m";
    flt4.priceToCollect = "+ \$231";
    flt4.carrierCode = "ua";
    flt4.isBestFlight = false;
    flt4.flightStats = 6;

    am4.isLegroom = false;
    am4.isOnDemandVideo = false;
    am4.isUSB = true;
    am4.isWifi = true;
    flt4.amenities = am4;

    flts.add(flt4);
    //-----------------------------------------------------------

    //-------------------Flight 5-----------------------------
    Flight flt5 = new Flight();
    Amenities am5 = new Amenities();
    flt5.origin = "ORD";
    flt5.destination = "SEA";
    flt5.departureTime = "08:05am";
    flt5.arrivalTime = "10:34am";
    flt5.travelTime = "4h 29m";
    flt5.priceToCollect = "+ \$240";
    flt5.carrierCode = "aa";
    flt5.isBestFlight = false;
    flt5.flightStats = 2;

    am5.isLegroom = false;
    am5.isOnDemandVideo = false;
    am5.isUSB = false;
    am5.isWifi = true;
    flt5.amenities = am5;

    flts.add(flt5);
    //-----------------------------------------------------------

    //-------------------Flight 6-----------------------------
    Flight flt6 = new Flight();
    Amenities am6 = new Amenities();
    flt6.origin = "ORD";
    flt6.destination = "SEA";
    flt6.departureTime = "08:40am";
    flt6.arrivalTime = "11:12am";
    flt6.travelTime = "4h 32m";
    flt6.priceToCollect = "+ \$250";
    flt6.carrierCode = "da";
    flt6.isBestFlight = false;
    flt6.flightStats = 3;

    am6.isLegroom = false;
    am6.isOnDemandVideo = false;
    am6.isUSB = true;
    am6.isWifi = false;
    flt6.amenities = am6;

    flts.add(flt6);
    //-----------------------------------------------------------

    //-------------------Flight 7-----------------------------
    Flight flt7 = new Flight();
    Amenities am7 = new Amenities();
    flt7.origin = "ORD";
    flt7.destination = "SEA";
    flt7.departureTime = "06:00am";
    flt7.arrivalTime = "08:30am";
    flt7.travelTime = "4h 30m";
    flt7.priceToCollect = "+ \$299";
    flt7.carrierCode = "aa";
    flt7.isBestFlight = false;
    flt7.flightStats = 7;

    am7.isLegroom = true;
    am7.isOnDemandVideo = false;
    am7.isUSB = true;
    am7.isWifi = true;
    flt7.amenities = am7;

    flts.add(flt7);
    //-----------------------------------------------------------
    trip1.trip = flts;
    fResults.trips.add(trip1);
    //---------------------------------------------------------------------

    //--------------------trip2---------------------------------------
    var trip2 = new TripInfo();
    trip2.trip = new List<Flight>();
    List<Flight> flts2 = new List<Flight>();
    
    //-------------------Flight 1-----------------------------
    Flight flt11 = new Flight();
    Amenities am11 = new Amenities();
    flt11.origin = "SEA";
    flt11.destination = "ORD";
    flt11.departureTime = "05:59pm";
    flt11.arrivalTime = "11:58pm";
    flt11.travelTime = "3h 58m";
    flt11.priceToCollect = "+ \$300";
    flt11.carrierCode = "da";
    flt11.isBestFlight = true;
    flt11.flightStats = 8;

    am11.isLegroom = true;
    am11.isOnDemandVideo = true;
    am11.isUSB = true;
    am11.isWifi = true;
    flt11.amenities = am11;

    flts2.add(flt11);
    //-----------------------------------------------------------

    //-------------------Flight 2-----------------------------
    Flight flt21 = new Flight();
    Amenities am21 = new Amenities();
    flt21.origin = "SEA";
    flt21.destination = "ORD";
    flt21.departureTime = "07:15am";
    flt21.arrivalTime = "09:50am";
    flt21.travelTime = "3h 35m";
    flt21.priceToCollect = "+ \$120";
    flt21.carrierCode = "da";
    flt21.isBestFlight = true;
    flt21.flightStats = 8;

    am21.isLegroom = true;
    am21.isOnDemandVideo = false;
    am21.isUSB = true;
    am21.isWifi = true;
    flt21.amenities = am21;

    flts2.add(flt21);
    //-----------------------------------------------------------

    //-------------------Flight 3-----------------------------
    Flight flt31 = new Flight();
    Amenities am31 = new Amenities();
    flt31.origin = "SEA";
    flt31.destination = "ORD";
    flt31.departureTime = "07:15am";
    flt31.arrivalTime = "10:00am";
    flt31.travelTime = "3h 45m";
    flt31.priceToCollect = "+ \$120";
    flt31.carrierCode = "da";
    flt31.isBestFlight = false;
    flt31.flightStats = 4;

    am31.isLegroom = false;
    am31.isOnDemandVideo = false;
    am31.isUSB = true;
    am31.isWifi = true;
    flt31.amenities = am31;

    flts2.add(flt31);
    //-----------------------------------------------------------

    //-------------------Flight 4-----------------------------
    Flight flt41 = new Flight();
    Amenities am41 = new Amenities();
    flt41.origin = "SEA";
    flt41.destination = "ORD";
    flt41.departureTime = "08:00am";
    flt41.arrivalTime = "10:30am";
    flt41.travelTime = "3h 30m";
    flt41.priceToCollect = "+ \$130";
    flt41.carrierCode = "ua";
    flt41.isBestFlight = false;
    flt41.flightStats = 4;

    am41.isLegroom = false;
    am41.isOnDemandVideo = false;
    am41.isUSB = true;
    am41.isWifi = true;
    flt41.amenities = am41;

    flts2.add(flt41);
    //-----------------------------------------------------------

    //-------------------Flight 5-----------------------------
    Flight flt51 = new Flight();
    Amenities am51 = new Amenities();
    flt51.origin = "SEA";
    flt51.destination = "ORD";
    flt51.departureTime = "08:05am";
    flt51.arrivalTime = "10:34am";
    flt51.travelTime = "3h 29m";
    flt51.priceToCollect = "+ \$150";
    flt51.carrierCode = "aa";
    flt51.isBestFlight = false;
    flt51.flightStats = 6;

    am51.isLegroom = false;
    am51.isOnDemandVideo = false;
    am51.isUSB = false;
    am51.isWifi = true;
    flt51.amenities = am51;

    flts2.add(flt51);
    //-----------------------------------------------------------

    //-------------------Flight 6-----------------------------
    Flight flt61 = new Flight();
    Amenities am61 = new Amenities();
    flt61.origin = "SEA";
    flt61.destination = "ORD";
    flt61.departureTime = "08:40am";
    flt61.arrivalTime = "11:12am";
    flt61.travelTime = "3h 32m";
    flt61.priceToCollect = "+ \$200";
    flt61.carrierCode = "da";
    flt61.isBestFlight = false;
    flt61.flightStats = 6;

    am61.isLegroom = false;
    am61.isOnDemandVideo = false;
    am61.isUSB = true;
    am61.isWifi = false;
    flt61.amenities = am61;

    flts2.add(flt61);
    //-----------------------------------------------------------

    //-------------------Flight 7-----------------------------
    Flight flt71 = new Flight();
    Amenities am71 = new Amenities();
    flt71.origin = "SEA";
    flt71.destination = "ORD";
    flt71.departureTime = "06:00am";
    flt71.arrivalTime = "08:30am";
    flt71.travelTime = "3h 30m";
    flt71.priceToCollect = "+ \$299";
    flt71.carrierCode = "aa";
    flt71.isBestFlight = false;
    flt71.flightStats = 9;

    am71.isLegroom = true;
    am71.isOnDemandVideo = false;
    am71.isUSB = true;
    am71.isWifi = true;
    flt71.amenities = am71;

    flts2.add(flt71);
    //-----------------------------------------------------------
    trip2.trip = flts2;
    fResults.trips.add(trip2);
    //---------------------------------------------------------------------
    data.flightResults = fResults;
    return data;
  }
  
  List<Flight> getDummySelectedFlights() {
    sleep(const Duration(seconds:3));
    List<Flight> results = new List<Flight>();
    
    //-------------------Flight 1-----------------------------
    Flight flt1 = new Flight();
    Amenities am1 = new Amenities();
    flt1.origin = "ORD";
    flt1.destination = "SEA";
    flt1.departureDateFormatted = "Mon, April 08";
    flt1.departureTime = "07:00am";
    flt1.arrivalTime = "09:30am";
    flt1.travelTime = "3h 30m";
    flt1.priceToCollect = "+ \$0";
    flt1.carrierCode = "da";
    flt1.isBestFlight = true;

    am1.isLegroom = true;
    am1.isOnDemandVideo = true;
    am1.isUSB = true;
    am1.isWifi = true;
    flt1.amenities = am1;

    results.add(flt1);
    //-----------------------------------------------------------

    //-------------------Flight 2-----------------------------
    Flight flt2 = new Flight();
    Amenities am2 = new Amenities();
    flt2.origin = "SEA";
    flt2.destination = "ORD";
    flt2.departureTime = "07:15pm";
    flt2.arrivalTime = "09:50pm";
    flt2.travelTime = "3h 35m";
    flt2.priceToCollect = "+ \$0";
    flt2.carrierCode = "da";
    flt2.isBestFlight = true;
    flt2.departureDateFormatted = "Mon, April 12";
    am2.isLegroom = true;
    am2.isOnDemandVideo = false;
    am2.isUSB = true;
    am2.isWifi = true;
    flt2.amenities = am2;

    results.add(flt2);
    //-----------------------------------------------------------
    return results;
  }
  AppBar buildAppBar(BuildContext context, String text){
    return new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            print('Menu button pressed');
            Navigator.pop(context);
          },
        ),
        title: new Text(text, style: new TextStyle(color: Colors.white),),
      );
  }
}