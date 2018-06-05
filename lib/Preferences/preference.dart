import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../order/flightSearch.dart';

class MyPreferences extends StatefulWidget {
  static String tag="mypreferences-Page";
 @override
 State<StatefulWidget> createState() {
    return MyHomePage();
  }
}


class MyHomePage extends State<MyPreferences> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  List<String> _events = <String>['', 'IT Events', 'Game Events', 'Cultural Events'];
  String _event = '';
  List<String> _dinings = <String>['', 'Italian', 'Russian', 'Indian'];
  String _dining = '';
  String stayWithinBudget = "Yes";
  String blendTravel = "Yes";
  String socialBasedSetting = "Yes";

// Method setting value.
  void handleBudgetValueChanged(String value) {
    setState(() {
      stayWithinBudget = value;
    });
  }

  void handleBlendValueChanged(String value) {
    setState(() {
      blendTravel = value;
    });
  }

  void handleSocialValueChanged(String value) {
    setState(() {
      socialBasedSetting = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Business Travel Supporting System"),
      ),
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new Row(          
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0),
                        child : new Text(
                                'Welcome Shiva',
                                style: const TextStyle(fontSize: 15.0),                               
                              )
                      ),              
                      ]),                   
                    ],
                  ),        
                  new Row(          
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0),
                        child : new Text(
                                'We are glad to make your Business Travel Exciting!',
                                style: const TextStyle(fontSize: 16.0),                               
                              )
                      ),              
                      ]),                   
                    ],
                  ),        
                  new InputDecorator(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.event),
                        labelText: 'Events Interested',
                      ),
                      isEmpty: _event == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          value: _event,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              _event = newValue;
                            });
                          },
                          items: _events.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  new Row(
                    children: <Widget>[
                      const Icon(Icons.menu),
                      new Container(
                        margin: const EdgeInsets.only(right: 20.0, left: 10.0),
                        child : new Text(
                                'Stay Withing Budget',
                                style: const TextStyle(fontSize: 17.0),                               
                              )
                      ),               
                      new Text ('Yes',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                        value: "Yes",
                        groupValue: stayWithinBudget,
                        onChanged: handleBudgetValueChanged
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                        value: "No",
                        groupValue: stayWithinBudget,
                        onChanged: handleBudgetValueChanged
                      ),
                    ]
                  ),     
                  new Row(
                    children: <Widget>[
                      const Icon(Icons.message),
                      new Container(
                        margin: const EdgeInsets.only(right: 80.0, left: 10.0),
                        child : new Text(
                                'Blend Travel',
                                style: const TextStyle(fontSize: 17.0),                               
                              )
                      ),           
                      new Text ('Yes',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                        value: "Yes",
                        groupValue: blendTravel,
                        onChanged: handleBlendValueChanged
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                        value: "No",
                        groupValue: blendTravel,
                        onChanged: handleBlendValueChanged
                      ),
                    ]
                  ),     
                  new InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.local_dining),
                      labelText: 'Dining Options',
                    ),
                    isEmpty: _dining == '',
                    child: new DropdownButtonHideUnderline(
                      child: new DropdownButton<String>(
                        value: _dining,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _dining = newValue;
                          });
                        },
                        items: _dinings.map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      const Icon(Icons.person),
                      new Container(
                        margin: const EdgeInsets.only(right: 20.0, left: 10.0),
                        child : new Text(
                                'Social Based Setting',
                                style: const TextStyle(fontSize: 17.0),                               
                              )
                      ),       
                      new Text ('Yes',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                          value: "Yes",
                          groupValue: socialBasedSetting,
                          onChanged: handleSocialValueChanged
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 17.0),), 
                      new Radio<String>(
                          value: "No",
                          groupValue: socialBasedSetting,
                          onChanged: handleSocialValueChanged
                      ),                      
                    ]
                  ),     
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.contact_mail),
                      hintText: 'Destination Zipcode',
                      labelText: 'Destination Zipcode',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),                                  
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: new RaisedButton(
                        child: const Text('Submit'),
                        onPressed: (){
                          Navigator.of(context).pushNamed(SearchScreen.tag);
                        },
                      )),
                ],
              ))),
    );
  }

  



} 