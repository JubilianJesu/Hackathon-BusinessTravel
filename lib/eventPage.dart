import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'model/eventModel.dart';

class EventListPage extends StatefulWidget {
static String tag="event-Page";
  @override
 State<StatefulWidget> createState() {
    return new EventListPageState();
  }
 
}
class EventListPageState extends State<EventListPage>{
 final List<String> items = new List<String>.generate(10000, (i) => "Item $i");
  
  @override
  Widget build(BuildContext context) {
    final title = 'Event List';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
        onTap: (){
          print("Container clicked");
        },
        child: new Container(
          padding: new EdgeInsets.only(left: 24.0, right:24.0),
          color: Colors.grey.shade400,
          child: new Column(
              children: [
                SizedBox(height: 10.0),
                new Text('. ${items[index]}', style: new TextStyle( color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0)),
                new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: new Text('Click If you Interested', style: new TextStyle( color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),
                        color: Colors.blueAccent,
                        onPressed: (){},
                      ),alignment: Alignment.bottomRight,),
              ]
          ),
        )
    );
          },
        ),
      ),
    );
  } 
}

