import 'package:flutter/material.dart';
import 'FlightResultsModel.dart';
import 'tripSummary.dart';
import 'FlightCommonComponent.dart';

class FlightResultsScreen extends StatelessWidget{  
static String tag="flightresult-Page";
FlightCommonComponent component = new FlightCommonComponent();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
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
              new Text("ORD", style: new TextStyle(color: Colors.white),),
              const Icon(
                Icons.flight_takeoff, color: Colors.white,
                size: 21.0,
              ),
              new Text("DEN", style: new TextStyle(color: Colors.white))
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

    var fltResults = component.getDummyFlightResults();
    for (var i = 0; i < fltResults.length; i++) {
      var fltWid = new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Row(
                  children: component.buildAirlineWidget(context, fltResults[i].carrierCode),
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
                    onPressed:() => _selectFlight(context),
                    child: new Text(
                      fltResults[i].priceToCollect,
                      style: new TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
                component.buildTripDetails(context, fltResults[i])
              ],
            ),
          )
        ],
      );
      fltWidgets.add(fltWid);
    }
    return fltWidgets;
  }
  

  void _selectFlight(BuildContext context) {
     Navigator.of(context).pushNamed(TripSummary.tag);
  }

 
}