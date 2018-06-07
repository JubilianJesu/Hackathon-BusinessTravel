import 'package:flutter/material.dart';
import 'FlightResults.dart';



class TripSummary extends StatefulWidget {
static String tag="tripsummary-Page";
@override
  State createState() => new TripSummaryState();
}

class TripSummaryState extends State<TripSummary> {
  @override
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

  Widget _buildBody() {
    return new Container(
      child: new ListView(
      scrollDirection: Axis.vertical,
      children : <Widget>[ new TripSummaryDetail(),new Offers() ]
      )
    );
  }
}

class TripSummaryDetail extends StatefulWidget{
@override
  State<StatefulWidget> createState() => new TripSummaryDetailState();
}

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new OffersCarousel("test");
}

class TripSummaryDetailState extends State<TripSummaryDetail> {
  @override
  Widget build(BuildContext context) {
    return new Container(
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
            )
    );
  }
}

class OffersCarousel extends State<Offers> {
  @override
  OffersCarousel(this.text);
  final String text;
  Widget build(BuildContext context) {
    return _carousel(text);
  }

  
  Color _myTextColor = Colors.black54;
  Color _myBackColor = Colors.white70;
  Widget _carousel(btnText) {
    return new GestureDetector(
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 40.0,
          minWidth: 80.0,
        ),
        child: new Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 9.0),
            //height: 40.0,
            //width:100.0,
            margin: const EdgeInsets.only(left:8.0),
            decoration: new BoxDecoration(
                color: _myBackColor,
                borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                border: Border.all(color: Colors.grey)),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  btnText,
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: _myTextColor, fontSize: 16.0),
                ),
                //const Icon(Icons.info_outline, color: Colors.black54, size: 20.0,)
              ],
            )),
      ),
      onTap: () {
        setState(() {
          if (_myTextColor == Colors.black54) {
            _myTextColor = Colors.white;
            _myBackColor = Colors.blueAccent;
          } else {
            _myTextColor = Colors.black54;
            _myBackColor = Colors.white70;
          }
        });
      },
    );
  }

}



