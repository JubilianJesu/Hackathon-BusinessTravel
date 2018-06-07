import 'package:flutter/material.dart';
import 'FlightResults.dart';
import 'FlightSearchModel.dart';



class SearchScreen extends StatefulWidget {
static String tag="ordersearch-Page";
  //modified
  @override //new
  State createState() => new SearchScreenState(); //new
}

class SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FlightSearchModel searchModel = new FlightSearchModel();
  bool isFlight = true;
  bool isHotel = false;
  void _handleOneWayClick() {}
  void _handleRTClick() {}
  void _handleMCClick() {}
  void _handleSwapAirportClick() {}
  void _handleMyLocationClick() {}

  Widget _buildTripType() {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              child: new Text(
                'One-way',
                style: new TextStyle(color: Colors.black54),
              ),
              onPressed: _handleOneWayClick,
              color: Colors.white70,
              elevation: 0.5,
            ),
            new RaisedButton(
                child: new Text(
                  'Round Trip',
                  style: new TextStyle(color: Colors.black54),
                ),
                onPressed: _handleRTClick,
                color: Colors.white70,
                elevation: 0.5),
            new RaisedButton(
                child: new Text(
                  'Multi City',
                  style: new TextStyle(color: Colors.black54),
                ),
                onPressed: _handleMCClick,
                color: Colors.white70,
                elevation: 0.5),
          ],
        ));
  }

  Widget _buildFromToBox() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: const BoxDecoration(
                border: const Border(
                    top: const BorderSide(width: 0.2, color: Colors.grey),
                    bottom: const BorderSide(width: 0.2, color: Colors.grey))),
            child: new Row(
              children: [
                new Container(
                  //height: 80.0,
                  child: new IconButton(
                      icon: const Icon(
                        Icons.swap_vert,
                        color: Colors.grey,
                      ),
                      onPressed: _handleSwapAirportClick),
                ),
                new Container(
                    width: 363.2,
                    //width: 350.0,
                    decoration: const BoxDecoration(
                        border: const Border(
                            left: const BorderSide(
                                width: 0.2, color: Colors.grey))),
                    //padding : const EdgeInsets.only(left: 8.0),
                    child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8.0, left: 8.0),
                          decoration: const BoxDecoration(
                              border: const Border(
                                  bottom: const BorderSide(
                                      width: 0.2, color: Colors.grey))),
                          child: new Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Icon(
                                Icons.flight_takeoff,
                                color: Colors.grey,
                              ),
                              new Flexible(
                                  child: new Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration.collapsed(
                                      hintText: "From"
                                      ),
                                      onSaved: (String value){
                                        this.searchModel.origin = value;
                                      },
                                ),
                              )),
                              new Container(
                                margin: const EdgeInsets.only(
                                    top: 0.0, bottom: 0.0),
                                //height: 20.0,
                                //alignment: const Alignment(-4.0, 0.0),
                                child: new IconButton(
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    onPressed: _handleMyLocationClick),
                              )
                            ],
                          ),
                        ),
                        new Container(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, top: 8.0, left: 8.0),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.flight_land,
                                color: Colors.grey,
                              ),
                              new Flexible(
                                  child: new Container(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: new TextFormField(
                                  decoration: new InputDecoration.collapsed(
                                      hintText: "To"),
                                      onSaved: (String value){
                                        this.searchModel.destination = value;
                                      },
                                ),
                              )),
                              new Container(
                                //height: 20.0,
                                //alignment: const Alignment(-4.0, 0.0),
                                child: new IconButton(
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.grey,
                                    ),
                                    onPressed: _handleMyLocationClick),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 8.0, bottom: 9.0),
            decoration: const BoxDecoration(
                border: const Border(
                    bottom: const BorderSide(width: 0.5, color: Colors.grey))),
            child: new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: new Icon(
                    Icons.date_range,
                    color: Colors.grey,
                  ),
                ),
                new Container(
                  child: new Flexible(
                      child: new Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    decoration: const BoxDecoration(
                        border: const Border(
                            right: const BorderSide(
                                width: 0.2, color: Colors.grey),
                            left: const BorderSide(
                                width: 0.2, color: Colors.grey))),
                    child: new TextField(
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Departure Date')),
                  )),
                ),
                new Container(
                  child: new Flexible(
                      child: new Container(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: new TextField(
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Return Date')),
                  )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _submitSearch() {
    return new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 33.0),
      margin: const EdgeInsets.only(top: 40.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              width: 350.0,
              height: 40.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('Search',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white70),
                  textAlign: TextAlign.center),
            ),
            onTap: () {
              print('Submit pressed');
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FlightResultsScreen()));
            },
          )
        ],
      ),
    );
  }

  Widget _travelOptions() {
    return Column(
      children: <Widget>[
        new Container(
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 0.2, color: Colors.grey))),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Container(
                    //width: 200.0,
                    child: new Row(
                      children: <Widget>[
                        new Checkbox(
                            value: isFlight,
                            onChanged: (bool val) {
                              setState(() {
                                isFlight = val;
                              });
                            }),
                        new Text('Flight',
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black54))
                      ],
                    ),
                  ),
                  new Container(
                    child: new Row(
                      children: <Widget>[
                        new Checkbox(
                            value: isHotel,
                            onChanged: (bool val) {
                              setState(() {
                                isHotel = val;
                              });
                            }),
                        new Text('Hotel',
                            style: new TextStyle(
                                fontSize: 16.0, color: Colors.black54))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        new Container(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
          decoration: const BoxDecoration(
              border: const Border(
                  bottom: const BorderSide(width: 0.2, color: Colors.grey))),
          height: 64.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomButton('Hotel'),
              CustomButton('Blend with leisure'),
              CustomButton('Social seating'),
              CustomButton('Taxi'),
              CustomButton('Rental Car')
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return new Container(
        child: new Form(
      key: this._formKey,
      child: new Column(
        children: <Widget>[
          new Container(
            child: _buildTripType(),
          ),
          new Container(
            child: _buildFromToBox(),
          ),
          new Container(
            child: _travelOptions(),
          ),
          new Container(
            child: _submitSearch(),
          )
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu button');
            },
          ),
          title: new Text("One Order")),
      body: _buildBody(),
    );
  }
}

class CustomButton extends StatefulWidget {
  @override
  CustomButton(this.text);
  final String text;
  State createState() => new CustomButtonState(text);
}

class CustomButtonState extends State<CustomButton> {
  @override
  CustomButtonState(this.text);
  final String text;
  Widget build(BuildContext context) {
    return _customButton(text);
  }

  Color _myTextColor = Colors.black54;
  Color _myBackColor = Colors.white70;
  Widget _customButton(btnText) {
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
            margin: const EdgeInsets.only(left: 8.0),
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



