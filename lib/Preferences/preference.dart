import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../order/flightSearch.dart';
import '../model/preferenceModel.dart';
import 'dart:ui';

class MyPreferences extends StatefulWidget {
  static String tag="mypreferences-Page";
 @override
 State<StatefulWidget> createState() {
    return MyHomePage();
  }
}


class MyHomePage extends State<MyPreferences> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _events = <String>['', 'IT Events', 'Game Events', 'Cultural Events'];
  String _event = '';
  List<String> _dinings = <String>['', 'Italian', 'Russian', 'Indian'];
  String _dining = '';
  String stayWithinBudgetValue = "Yes";
  String blendTravelValue = "Yes";
  String socialBasedSettingValue = "Yes";
  PreferenceModel myPreference = new PreferenceModel();

// Method setting value.
  void handleBudgetValueChanged(String value) {
    setState(() {
      stayWithinBudgetValue = value;
    });
  }

  void handleBlendValueChanged(String value) {
    setState(() {
      blendTravelValue = value;
    });
  }

  void handleSocialValueChanged(String value) {
    setState(() {
      socialBasedSettingValue = value;
    });
  }

   void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

    showDialog(context: context,  builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Rewind and remember'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('${myPreference.eventInterested}'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

      print('Form save called, myPreference is now up to date...');
      print('EventInterested: ${myPreference.eventInterested}');
      print('StayWithWidget: ${myPreference.stayWithWidget}');
      print('BlendTravel: ${myPreference.blendTravel}');
      print('DiningOption: ${myPreference.diningOption}');
      print('SocialSetting: ${myPreference.socialSetting}');
      print('DestinationZipcode: ${myPreference.destinationZipcode}');
      print('========================================');
      //print('Submitting to back end...');
      print('TODO - we will write the submission part next...');
    }
  }

  


  @override
  Widget build(BuildContext context) {

  final eventsInterested = InputDecorator(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.event, color: Colors.white,),
                        labelText: 'Events Interested',
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),  
                      ),
                      isEmpty: _event == '',
                      child: new DropdownButtonHideUnderline(
                        child: new DropdownButton<String>(
                          value: _event,
                          isDense: true,
                          onChanged: (String newValue) {
                            setState(() {
                              myPreference.eventInterested = newValue;
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
                    );

  final stayWithinBudget = Row(
                    children: <Widget>[
                      const Icon(Icons.menu, color: Colors.white, size: 16.0,),
                      new Container(
                        margin: const EdgeInsets.only(right: 10.0, left: 5.0),
                        child : new Text(
                                'Stay Withing Budget',
                                style: const TextStyle(fontSize: 16.0, color: Colors.white),                               
                              )
                      ),               
                      new Text ('Yes',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                        value: "Yes",
                        groupValue: stayWithinBudgetValue,
                        onChanged: (String newValue) {
                            setState(() {
                              myPreference.stayWithWidget = newValue;
                              handleBudgetValueChanged(newValue);
                            });
                          },
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                        value: "No",
                        groupValue: stayWithinBudgetValue,
                        onChanged: (String newValue) {
                            setState(() {
                              myPreference.stayWithWidget = newValue;
                              handleBudgetValueChanged(newValue);
                            });
                          },
                      ),
                    ]
                  );

  final blendTravel = Row(
                    children: <Widget>[
                      const Icon(Icons.message, color: Colors.white,),
                      new Container(
                         margin: const EdgeInsets.only(right: 60.0),
                        child : new Text(
                                'Blend Travel',
                                style: const TextStyle(fontSize: 16.0, color: Colors.white),                               
                              )
                      ),           
                      new Text ('Yes',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                        value: "Yes",
                        groupValue: blendTravelValue,
                        onChanged: (String newValue) {
                            setState(() {
                              myPreference.blendTravel = newValue;
                              handleBlendValueChanged(newValue);
                            });
                          },
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                        value: "No",
                        groupValue: blendTravelValue,
                        onChanged: (String newValue) {
                            setState(() {
                              myPreference.blendTravel = newValue;
                              handleBlendValueChanged(newValue);
                            });
                          },
                      ),
                    ]
                  );
  final diningOptions = InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.local_dining, color: Colors.white,),
                      labelText: 'Dining Options',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),  
                    ),
                    isEmpty: _dining == '',
                    child: new DropdownButtonHideUnderline(
                      child: new DropdownButton<String>(
                        value: _dining,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            myPreference.diningOption = newValue;
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
                  );

  final socialBasedSetting = Row(
                    children: <Widget>[
                      const Icon(Icons.person, color: Colors.white,size: 16.0,),
                      new Container(
                        margin: const EdgeInsets.only(right: 10.0, left: 5.0),
                        child : new Text(
                                'Social Based Setting',
                                style: const TextStyle(fontSize: 16.0, color: Colors.white),                               
                              )
                      ),       
                      new Text ('Yes',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                          value: "Yes",
                          groupValue: socialBasedSettingValue,
                          onChanged: (String newValue) {
                            setState(() {
                              myPreference.blendTravel = newValue;
                              handleSocialValueChanged(newValue);
                            });
                          },
                      ),
                      new Text ('No',style: const TextStyle(fontSize: 16.0, color: Colors.white),), 
                      new Radio<String>(
                          value: "No",
                          groupValue: socialBasedSettingValue,
                          onChanged: (String newValue) {
                            setState(() {
                              myPreference.blendTravel = newValue;
                              handleSocialValueChanged(newValue);
                            });
                          },
                      ),                      
                    ]
                  );
                  
  final destinationZipCode = TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.contact_mail, color: Colors.white,),
                      hintText: 'Destination Zipcode',
                      labelText: 'Destination Zipcode',
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),
                      hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                    onSaved: (val) => myPreference.destinationZipcode = val,
                  );

  final submitButton = Container(
                        width: 350.0,
                        height: 40.0,
                        margin: const EdgeInsets.only(left: 30.0, top: 30.0,right: 30.0),
                        child: new RaisedButton(   
                          color: Colors.lightBlue,
                          splashColor: Colors.blueGrey,                       
                          child: Text('Submit',style: new TextStyle(fontSize: 20.0, color: Colors.white70),
                              textAlign: TextAlign.center ), 
                          onPressed: (){
                            submitForm();
                            Navigator.of(context).pushNamed(SearchScreen.tag);
                          },
                        )
                      );
                      
  final welcomeMessage =  Row(          
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0),
                        child : new Text(
                                'Welcome Shiva',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.white),                               
                              )
                      ),              
                      ]),                   
                    ],
                  );    

  final headerMessage = Row(          
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [            
                      new Column(children: [  new Container(
                        margin: const EdgeInsets.only(top:10.0),
                        child : new Text(
                                'Glad to make your Business Travel Exciting!',
                                style: const TextStyle(fontSize: 16.0, color: Colors.white),                               
                              )
                      ),              
                      ]),                   
                    ],
                  );

  final line = Container(
          color: Colors.white.withOpacity(0.85),
          margin: const EdgeInsets.symmetric(vertical: 16.0),
          width: 225.0,
          height: 2.0,
        );

  Widget buildContent() {
    return new SafeArea(
          top: false,
          bottom: false,
          child: 
            new Form(            
              key: _formKey,
              autovalidate: true,              
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  welcomeMessage,   
                  line,
                  headerMessage,        
                  eventsInterested,
                  stayWithinBudget,     
                  blendTravel,     
                  diningOptions,
                  socialBasedSetting,     
                  destinationZipCode,                                  
                  submitButton,
                ],
              )
            )
          );
  }
  return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print('Menu button');
            },
          ),
          title: new Text("My Preferences")
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("assets/background.jpg", fit: BoxFit.cover),
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Container(
              color: Colors.black.withOpacity(0.3),
              child: buildContent(),
            ),
          ),
        ],
      ),
      //body: buildContent(),
    );
  }
} 