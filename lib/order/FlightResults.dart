import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'FlightResultsModel.dart';
import 'tripSummary.dart';

class FlightResultsScreen extends StatelessWidget{  
static String tag="flightresult-Page";
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('Menu button pressed');
            Navigator.pop(context);
          },
        ),
        title: new Container(
          width: 115.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text("ORD"),
              const Icon(
                Icons.flight_takeoff,
                size: 21.0,
              ),
              new Text("DEN")
            ],
          ),
        ),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return new Container(
        child: new ListView(
            scrollDirection: Axis.vertical, children: buildFlight(context)));
  }

  List<Widget> buildFlight(BuildContext context) {
    List<Widget> fltWidgets = new List<Widget>();

    var fltResults = getDummyFlightResults();
    for (var i = 0; i < fltResults.length; i++) {
      var fltWid = new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: buildAirlineWidget(context, fltResults[i].carrierCode),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    fltResults[i].isBestFlight ? new Container(
                      padding: const EdgeInsets.only(
                          top: 2.0, right: 3.0, bottom: 2.0, left: 3.0),
                      decoration: const BoxDecoration(color: Colors.green),
                      child: new Text(
                        'Best Flight',
                        style: new TextStyle(color: Colors.white),
                      ),
                    ): new Container()
                  ],
                )
              ],
            ),
          ),
          new Container(
            height: 70.0,
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
            decoration: const BoxDecoration(
                border: const Border(
                    bottom: const BorderSide(width: 1.0, color: Colors.grey))),
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new RaisedButton(
                    onPressed: _selectFlight,
                    child: new Text(
                      fltResults[i].priceToCollect,
                      style: new TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                new Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                fltResults[i].departureTime,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            new Container(
                              child: new Text(fltResults[i].origin,
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(fontSize: 17.0)),
                            ),
                          ],
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Container(
                            child: new Text(fltResults[i].travelTime),
                          ),
                          new Container(
                            width: 190.0,
                            margin: const EdgeInsets.only(top: 9.8),
                            decoration: const BoxDecoration(
                                border: const Border(
                                    bottom: const BorderSide(
                                        width: 1.0, color: Colors.black87))),
                          ),
                          new Container(
                              child: new Row(
                            children: getFlightAmenities(fltResults[i].amenities, context),
                          ))
                        ],
                      ),
                      new Container(
                        //margin: const EdgeInsets.only(left: 8.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                fltResults[i].arrivalTime,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            new Container(
                              child: new Text(fltResults[i].destination,
                                  textAlign: TextAlign.right,
                                  style: new TextStyle(fontSize: 17.0)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      );
      fltWidgets.add(fltWid);
    }
    return fltWidgets;
  }

  List<Widget> buildAirlineWidget(BuildContext context, String carrierCode) {
    String _logoPath, operatorName;
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
    List<Widget> lstWidg = new List<Widget>();
    lstWidg.add(new Image.asset(
      _logoPath,
      height: 16.0,
    ));
    lstWidg.add(new Container(
        margin: const EdgeInsets.only(left: 3.0),
        child: new Text(
          operatorName,
          style: new TextStyle(fontSize: 16.0),
        )));
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
    return lstWidgets;
  }

  void _selectFlight() {
    // Navigator.of(context).pushNamed(TripSummary.tag);
  }

  List<Flight> getDummyFlightResults() {
    List<Flight> results = new List<Flight>();
    
    //-------------------Flight 1-----------------------------
    Flight flt1 = new Flight();
    Amenities am1 = new Amenities();
    flt1.origin = "ORD";
    flt1.destination = "DEN";
    flt1.departureTime = "07:00am";
    flt1.arrivalTime = "09:30am";
    flt1.travelTime = "2h 30m";
    flt1.priceToCollect = "+ \$0";
    flt1.carrierCode = "aa";
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
    flt2.origin = "ORD";
    flt2.destination = "DEN";
    flt2.departureTime = "07:15am";
    flt2.arrivalTime = "09:50am";
    flt2.travelTime = "2h 35m";
    flt2.priceToCollect = "+ \$0";
    flt2.carrierCode = "ua";
    flt2.isBestFlight = true;

    am2.isLegroom = true;
    am2.isOnDemandVideo = false;
    am2.isUSB = true;
    am2.isWifi = true;
    flt2.amenities = am2;

    results.add(flt2);
    //-----------------------------------------------------------

    //-------------------Flight 3-----------------------------
    Flight flt3 = new Flight();
    Amenities am3 = new Amenities();
    flt3.origin = "ORD";
    flt3.destination = "DEN";
    flt3.departureTime = "07:15am";
    flt3.arrivalTime = "10:00am";
    flt3.travelTime = "2h 45m";
    flt3.priceToCollect = "+ \$0";
    flt3.carrierCode = "da";
    flt3.isBestFlight = false;

    am3.isLegroom = false;
    am3.isOnDemandVideo = false;
    am3.isUSB = true;
    am3.isWifi = true;
    flt3.amenities = am3;

    results.add(flt3);
    //-----------------------------------------------------------

    //-------------------Flight 4-----------------------------
    Flight flt4 = new Flight();
    Amenities am4 = new Amenities();
    flt4.origin = "ORD";
    flt4.destination = "DEN";
    flt4.departureTime = "08:00am";
    flt4.arrivalTime = "10:30am";
    flt4.travelTime = "2h 30m";
    flt4.priceToCollect = "+ \$0";
    flt4.carrierCode = "ua";
    flt4.isBestFlight = false;

    am4.isLegroom = false;
    am4.isOnDemandVideo = false;
    am4.isUSB = true;
    am4.isWifi = true;
    flt4.amenities = am4;

    results.add(flt4);
    //-----------------------------------------------------------

    //-------------------Flight 5-----------------------------
    Flight flt5 = new Flight();
    Amenities am5 = new Amenities();
    flt5.origin = "ORD";
    flt5.destination = "DEN";
    flt5.departureTime = "08:05am";
    flt5.arrivalTime = "10:34am";
    flt5.travelTime = "2h 29m";
    flt5.priceToCollect = "+ \$0";
    flt5.carrierCode = "aa";
    flt5.isBestFlight = false;

    am5.isLegroom = false;
    am5.isOnDemandVideo = false;
    am5.isUSB = false;
    am5.isWifi = true;
    flt5.amenities = am5;

    results.add(flt5);
    //-----------------------------------------------------------

    //-------------------Flight 6-----------------------------
    Flight flt6 = new Flight();
    Amenities am6 = new Amenities();
    flt6.origin = "ORD";
    flt6.destination = "DEN";
    flt6.departureTime = "08:40am";
    flt6.arrivalTime = "11:12am";
    flt6.travelTime = "2h 32m";
    flt6.priceToCollect = "+ \$0";
    flt6.carrierCode = "da";
    flt6.isBestFlight = false;

    am6.isLegroom = false;
    am6.isOnDemandVideo = false;
    am6.isUSB = true;
    am6.isWifi = false;
    flt6.amenities = am6;

    results.add(flt6);
    //-----------------------------------------------------------

    //-------------------Flight 7-----------------------------
    Flight flt7 = new Flight();
    Amenities am7 = new Amenities();
    flt7.origin = "ORD";
    flt7.destination = "DEN";
    flt7.departureTime = "06:00am";
    flt7.arrivalTime = "08:30am";
    flt7.travelTime = "2h 30m";
    flt7.priceToCollect = "+ \$99";
    flt7.carrierCode = "aa";
    flt7.isBestFlight = false;

    am7.isLegroom = true;
    am7.isOnDemandVideo = false;
    am7.isUSB = true;
    am7.isWifi = true;
    flt7.amenities = am7;

    results.add(flt7);
    //-----------------------------------------------------------
    return results;
  }
}