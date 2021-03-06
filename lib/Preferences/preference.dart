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
    'IT Events',
    'Game Events',
    'Cultural Events'
  ];
  String _event = '';
  List<String> _dinings = <String>['', 'Italian', 'Russian', 'Indian'];
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
    final eventsInterested = InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.event,
          color: Colors.grey,
        ),
        labelText: 'Events Interested',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
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

    final stayWithinBudget = Row(children: <Widget>[
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
    final diningOptions = InputDecorator(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.local_dining,
          color: Colors.grey,
        ),
        labelText: 'Dining Options',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
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

    final destinationZipCode = TextFormField(
      decoration: const InputDecoration(
        icon: const Icon(
          Icons.contact_mail,
          color: Colors.grey,
        ),
        hintText: 'Destination Zipcode',
        labelText: 'Destination Zipcode',
        labelStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
        hintStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15.0, color: Colors.black),
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
        margin: const EdgeInsets.only(left: 30.0, top: 30.0, right: 30.0),
        child: new RaisedButton(
          color: Colors.deepPurpleAccent,
          splashColor: Colors.blueGrey,
          child: Text('Submit',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
              textAlign: TextAlign.center),
          onPressed: () {
            submitForm();
            Navigator.of(context).pushNamed(LandingPage.tag);
          },
        ));

    final welcomeMessage = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        new Column(children: [
          new Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: new Text(
                'Welcome Jessie',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
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
              margin: const EdgeInsets.only(top: 10.0),
              child: new Text(
                'Glad to make your Business Travel Exciting!',
                style: const TextStyle(fontSize: 12.0, color: Colors.black),
              )),
        ]),
      ],
    );

    final line = Container(
      color: Colors.black.withOpacity(0.85),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
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
                  eventsInterested,
                  stayWithinBudget,
                  blendTravel,
                  diningOptions,
                  socialBasedSetting,
                  femineCare,
                  destinationZipCode,
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
