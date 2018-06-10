import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dstore/dStoreList.dart';
import 'Preferences/preference.dart';
import 'dstore/dstore.dart';
import 'order/flightSearch.dart';
import 'tagPage.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';
import 'order/flightSearch.dart';

class LandingPage extends StatefulWidget {
static String tag="landing-Page";
  @override
 State<StatefulWidget> createState() {
    return new LandingPageState();
  }
}

class LandingPageState extends State<LandingPage>{
   
  void clickTag(){
    Navigator.of(context).pushNamed(TagPage.tag);
  }

  // Future<String> getPnrDetails() async{
  //   http.Response response = await http.get(
  //     Uri.encodeFull("http://businesstravel20180603032656.azurewebsites.net/api/Values"),
  //     headers:{
  //       "Accept" : "application/json"
  //     }
  //   );
  //   print(response.body);
  // }
  void clickDStore(){
    //getPnrDetails();
    Navigator.of(context).pushNamed(MySpace.tag);
  }
 @override
  Widget build(BuildContext context) {
      final logo = Hero(
        tag: "tcsLogo",
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 50.0, child: Image.asset('assets/logo.png'),
        ),
      );

      final orderButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.deepPurpleAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                Navigator.of(context).pushNamed(SearchScreen.tag);
              },
              color: Colors.deepPurpleAccent,
              child: Text('Orders', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final tagButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.deepPurpleAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                Navigator.of(context).pushNamed(TagPage.tag);
              },
              color: Colors.deepPurpleAccent,
              child: Text('Tag', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final dStoreButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.deepPurpleAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                clickDStore();
                
               },
              color: Colors.deepPurpleAccent,
              child: Text('My Space', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

    var drawer = new Drawer();
    return new Scaffold( // 1
    drawer: drawer,
      appBar: new AppBar(
      title: new Text("Business Travel"), // screen title,
      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset("assets/HubBG.png", fit: BoxFit.cover),
          new BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 0.0, sigmaY: 0.0),
            child: new Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 24.0, right:24.0),
                    children: <Widget>[
                      SizedBox(height: 48.0),
                      orderButton,
                      SizedBox(height: 48.0),
                      tagButton,
                      SizedBox(height: 48.0),
                      dStoreButton,
                    ],
                  )
                ),
            ),
          ),
        ],
      ),
    );
  }
}
void orderDetailsClick(BuildContext context){
  Navigator.of(context).pushNamed('/OrderDetails');
}




