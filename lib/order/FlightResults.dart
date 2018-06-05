import 'package:flutter/material.dart';

class FlightResultsScreen extends StatelessWidget{  
static String tag="flightresult-Page";
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            print('Menu button pressed');
            Navigator.pop(context);
          },
        ),
        title: new Text('One Order'),
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    return new Container(
      child: new ListView(
        scrollDirection: Axis.vertical,
          children: <Widget>[
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight(),
            _buildFlight()
          ],
      ),
    );
  }
  Widget _buildFlight(){
    return new Container(
      height: 70.0,
      padding: const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
      decoration: const BoxDecoration(border: const Border(bottom: const BorderSide(width: 1.0, color: Colors.grey))),
      child: new Row(
        children: <Widget>[
          new Container(
            child: new RaisedButton(
                onPressed: _selectFlight,
                child: new Text("\$150", style: new TextStyle(fontSize: 22.0),),
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
                        child: new Text('10:10am', textAlign: TextAlign.right,),
                      ),
                      new Container(
                        child: new Text('ORD', textAlign: TextAlign.right, style: new TextStyle(fontSize: 16.0)),
                      ),
                    ],
                  ),
                ),
                new Column(
                  children: <Widget>[
                    new Container(
                      child: new Text('2h 35m'),
                    ),
                    new Container(
                      width: 190.0,
                      margin: const EdgeInsets.only(top: 9.8),
                      decoration: const BoxDecoration(border: const Border(bottom: const BorderSide(width: 1.0, color: Colors.black87))),
                    ),
                    new Container(
                      child: const Icon(Icons.wifi, size: 15.0,),
                    )
                  ],
                ),
                new Container(
                  //margin: const EdgeInsets.only(left: 8.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                        child: new Text('12:10pm', textAlign: TextAlign.right,),
                      ),
                      new Container(
                        child: new Text('DEN', textAlign: TextAlign.right, style: new TextStyle(fontSize: 16.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _selectFlight(){

  }
}