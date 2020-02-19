import 'package:businesstravel/orderDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../landingPage.dart';
import '../model/preferenceModel.dart';
import '../order/flightSearch.dart';
import '../model/preferenceModel.dart';
import 'dart:ui';
import '../landingPage.dart';

class MyPreferences extends StatefulWidget {
  static String tag = "mypreferences-Page";
  @override
  State<StatefulWidget> createState() {
    return MyHomePage();
  }
}

class MyHomePage extends State<MyPreferences> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _events = <String>[
    '',
    'Cannot Walk',
    'Cannot Walk long distance',
    'Cannot Aecend or Descend Steps'
  ];
  List<String> _assisatnceLevels = <String>[
    '',
    'From Lobby',
    'Self Movement to Gate'
  ];
  String _event = '';
  List<String> _typeOfWheelChairs = <String>['', 'Standard Manual', 'Battery Operated'];
  String _dining = '';
  String stayWithinBudgetValue = "Yes";
  String blendTravelValue = "Yes";
  String socialBasedSettingValue = "Yes";
  String femaleFriendly = "Yes";
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

  void handleFemaleFriendly(String value) {
    setState(() {
      femaleFriendly = value;
    });
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event

      // showDialog(context: context,  builder: (BuildContext context) {
      //     return new AlertDialog(
      //       title: new Text('Rewind and remember'),
      //       content: new SingleChildScrollView(
      //         child: new ListBody(
      //           children: <Widget>[
      //             new Text('${myPreference.eventInterested}'),
      //           ],
      //         ),
      //       ),
      //       actions: <Widget>[
      //         new FlatButton(
      //           child: new Text('Regret'),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );

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

    var _asstianceLevel = 'From Lobby';//'Games event';
    final assistanceLevel = InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.event,
          color: Colors.grey,
        ),
        labelText: 'AssistanceLevel Level',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),

      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: _asstianceLevel,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              myPreference.assisatanceLevel = newValue;
              _asstianceLevel = newValue;
            });
          },
          items: _assisatnceLevels.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
      ),
    );

    var _mobilityLevel = 'Cannot Walk';
    final mobilityLevel = InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.event,
          color: Colors.grey,
        ),
        labelText: 'Mobility Level',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),

      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: _mobilityLevel,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              myPreference.mobilityLevel = newValue;
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
      const Icon(
        Icons.menu,
        color: Colors.grey,
        size: 16.0,
      ),
      new Container(
          margin: const EdgeInsets.only(right: 5.0, left: 5.0),
          child: new Text(
            'Stay Withing Budget',
            style: const TextStyle(fontSize: 14.0, color: Colors.black),
          )),
      new Text(
        'Yes',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
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
      new Text(
        'No',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
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
    ]);

    final blendTravel = Row(children: <Widget>[
      const Icon(
        Icons.message,
        color: Colors.grey,
      ),
      new Container(
          margin: const EdgeInsets.only(right: 60.0),
          child: new Text(
            'Blend Travel',
            style: const TextStyle(fontSize: 14.0, color: Colors.black),
          )),
      new Text(
        'Yes',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
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
      new Text(
        'No',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
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
    ]);
    
    var _typeOfWheelChair = 'Battery Operated';
    final typeOfWheelChair = InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.local_dining,
          color: Colors.grey,
        ),
        labelText: 'Dining Options',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),
      child: new DropdownButtonHideUnderline(
        child: new DropdownButton<String>(
          value: _typeOfWheelChair,
          isDense: true,
          onChanged: (String newValue) {
            setState(() {
              myPreference.diningOption = newValue;
              _typeOfWheelChair = newValue;
            });
          },
          items: _typeOfWheelChairs.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
      ),
    );

    final socialBasedSetting = Row(children: <Widget>[
      const Icon(
        Icons.person,
        color: Colors.grey,
        size: 16.0,
      ),
      new Container(
          //margin: const EdgeInsets.only(right: 2.0, left: 5.0),
          child: new Text(
            'Social Based Setting',
            style: const TextStyle(fontSize: 14.0, color: Colors.black),
          )),
      new Text(
        'Yes',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      new Radio<String>(
        value: "Yes",
        groupValue: socialBasedSettingValue,
        onChanged: (String newValue) {
          setState(() {
            myPreference.socialSetting = newValue;
            handleSocialValueChanged(newValue);
          });
        },
      ),
      new Text(
        'No',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      new Radio<String>(
        value: "No",
        groupValue: socialBasedSettingValue,
        onChanged: (String newValue) {
          setState(() {
            myPreference.socialSetting = newValue;
            handleSocialValueChanged(newValue);
          });
        },
      ),
    ]);
    
    

    final femineCare = Row(children: <Widget>[
      const Icon(
        Icons.person,
        color: Colors.grey,
        size: 16.0,
      ),
      new Container(
          margin: const EdgeInsets.only(right: 32.0, left: 5.0),
          child: new Text(
            'Female Friendly',
            style: const TextStyle(fontSize: 14.0, color: Colors.black),
          )),
      new Text(
        'Yes',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      new Radio<String>(
        value: "Yes",
        groupValue: femaleFriendly,
        onChanged: (String newValue) {
          setState(() {
            myPreference.femaleFriendly = newValue;
            handleFemaleFriendly(newValue);
          });
        },
      ),
      new Text(
        'No',
        style: const TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      new Radio<String>(
        value: "No",
        groupValue: femaleFriendly,
        onChanged: (String newValue) {
          setState(() {
            myPreference.femaleFriendly = newValue;
            handleFemaleFriendly(newValue);
          });
        },
      ),
    ]);

    final assemblyInstructions = TextFormField(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.contact_mail,
          color: Colors.grey,
        ),
        hintText: 'Assembly Instructions',
        labelText: 'Assembly Instructions',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),
      keyboardType: TextInputType.text,
      onSaved: (val) => myPreference.destinationZipcode = val,
    );

    final dimensions = TextFormField(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.contact_mail,
          color: Colors.grey,
        ),
        hintText: 'Dimensions',
        labelText: 'Dimensions',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
      ),
      keyboardType: TextInputType.text,
      onSaved: (val) => myPreference.destinationZipcode = val,
    );

    final submitButton = Container(
        width: 350.0,
        height: 40.0,
        margin: const EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0),
        child: new RaisedButton(
          color: Colors.deepPurpleAccent,
          splashColor: Colors.blueGrey,
          child: Text('Submit',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
              textAlign: TextAlign.center),
          onPressed: () {
            submitForm();
            Navigator.of(context).pushNamed(SearchScreen.tag);
          },
        ));

    final welcomeMessage = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        new Column(children: [
          new Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: new Text(
                'Welcome Jane',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              )),
        ]),
      ],
    );

    final headerMessage = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Column(children: [
          new Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: new Text(
                'Lets Capture Your Mobility Details!',
                style: const TextStyle(fontSize: 15.0, color: Colors.black),
              )),
        ]),
      ],
    );

    final line = Container(
      color: Colors.black.withOpacity(0.85),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: 200.0,
      height: 2.0,
    );

    Widget buildContent() {
      return new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              key: _formKey,
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                children: <Widget>[
                  welcomeMessage,
                  line,
                  headerMessage,
                  mobilityLevel,
                  assistanceLevel,
                  typeOfWheelChair,
                  assemblyInstructions,
                dimensions,
                  submitButton,
                ],
              )));
    }

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('Menu button');
            },
          ),
          title: new Text("My Preferences")),
      body: new Stack(
        children: <Widget>[
          //new Image.asset("assets/background.jpg", fit: BoxFit.cover),
          buildContent(),
        ],
      ),
      //body: buildContent(),
    );
  }
}
