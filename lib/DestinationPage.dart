import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/eventModel.dart';
import 'package:http/http.dart' as http;

class DestinationListPage extends StatefulWidget {
  static String tag = "destination-Page";
  @override
  DestinationListPageState createState() => DestinationListPageState();
}

class DestinationListPageState extends State<DestinationListPage> {
  final String url = "https://api.coinmarketcap.com/v2/listings/";
  List data;

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["data"];
    });

    return "Success!";
  }
final clickInterestedButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 100.0,
              height: 30.0,
              onPressed: (){
                
               },
              color: Colors.lightBlueAccent,
              child: Text('Click if Interrested', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: new AppBar(
      title: new Text("BTS - Destination", style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)), // screen title,
      ),
      body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Card(
                        child: Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Text(
                                  "Why doesn't this text wrap? There's plenty of vertical space...",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                                  clickInterestedButton,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }
}
