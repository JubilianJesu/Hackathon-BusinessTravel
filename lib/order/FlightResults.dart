import 'package:flutter/material.dart';
import 'tripSummary.dart';
import 'FlightCommonComponent.dart';
import 'FlightResultsModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'FlightShopRequest.dart';

class FlightResultsScreen extends StatefulWidget {
  static String tag = "flightresult-Page";
  final FlightShopRequest flightShopRequest;
  FlightResultsScreen(this.flightShopRequest);
  //modified
  @override //new
  State createState() => new FlightResultsScreenState(this.flightShopRequest); //new
}

class FlightResultsScreenState extends State<FlightResultsScreen> {
  final FlightShopRequest flightShopRequest;
  FlightResultsScreenState(this.flightShopRequest);
  FlightCommonComponent component = new FlightCommonComponent();
  var currentTripIndex = 0;
  var totalTrips = 0;
  ScrollController _scrollController;
  FlightResultsData results;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _scrollController = new ScrollController();
      results = component.getDummyFlightResults();
    }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            print('Menu button pressed');
            Navigator.pop(context);
          },
        ),
        title: new Container(
          //width: 115.0,
          // child: new Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: <Widget>[
          //     new Text(
          //       "ORD",
          //       style: new TextStyle(color: Colors.white),
          //     ),
          //     const Icon(
          //       Icons.flight_takeoff,
          //       color: Colors.white,
          //       size: 21.0,
          //     ),
          //     new Text("DEN", style: new TextStyle(color: Colors.white))
          //   ],
          // ),
          child: new Text(
                "Select Flight",
                style: new TextStyle(color: Colors.white),
              ),
        ),
      ),
      //body: buildBody(context),
      body: new FutureBuilder<FlightResultsData>(
        future: fetchPost(),
        builder: (context, resp){
          if(resp.hasData){
            if(resp.data.flightResults != null && resp.data.flightResults.trips != null && resp.data.flightResults.trips.length > 0){
              return buildBody(context, resp.data);
            }
            else {
              return buildBody(context, component.getDummyFlightResults());
            }
          }
          else if (resp.hasError){
            return buildBody(context, component.getDummyFlightResults());
          }
          return new Center(
            child: CircularProgressIndicator(),
          ) ;
        },
      )
    );
  }

  Widget buildBody(BuildContext context, FlightResultsData results) {
    return new Container(
        child: new ListView(
            controller: _scrollController,
            scrollDirection: Axis.vertical, children: buildFlight(context, results)));
  }

  List<Widget> buildFlight(BuildContext context, FlightResultsData results) {
    List<Widget> fltWidgets = new List<Widget>();

    //var results = component.getDummyFlightResults();
    totalTrips = results.flightResults.trips.length;

    var fltResults = results.flightResults.trips[currentTripIndex].trip;

    for (var i = 0; i < fltResults.length; i++) {
      var fltWid = new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize:MainAxisSize.max,
              children: <Widget>[
                new Row(
                  children: component.buildAirlineWidget(
                      context, fltResults[i].carrierCode),
                ),
                new Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    fltResults[i].isBestFlight!= null && fltResults[i].isBestFlight ? new Container(
                      padding: const EdgeInsets.only(
                          top: 2.0,bottom: 2.0, left: 3.0),
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
                new SizedBox(  
                  width: 60.0,                
                  child: new RaisedButton(
                    splashColor: Colors.blue,                    
                    onPressed:() => _selectFlight(context),
                    child: new Text(
                      fltResults[i].priceToCollect,
                      style: new TextStyle(fontSize: 14.0),
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
    setState(() {
      if (totalTrips == currentTripIndex+1) {
        Navigator.of(context).pushNamed(TripSummary.tag);
      }
      else{
        currentTripIndex++;
        _scrollController.animateTo(0.0, duration: new Duration(milliseconds: 1), curve: Curves.ease);
      }
    });
  }
  Future<FlightResultsData> fetchPost() async {
    try{
        var url = 'http://ndcwas18.azurewebsites.net/api/Shop/flights/1/'+ this.flightShopRequest.origin + '/' + this.flightShopRequest.destination +'/'+ this.flightShopRequest.departureDate + '/' + this.flightShopRequest.returnDate;
    final response = await http.get(url);
    
    Map fResultsMap =  json.decode(response.body);
    return new FlightResultsData.fromJson(fResultsMap);
    }
    catch(ex){
      return component.getDummyFlightResults();
    }
    
  }
}
