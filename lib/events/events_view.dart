
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/offers.dart';
import '../scroller/OfferPage.dart';
import 'package:http/http.dart' as http;

class MyEvents extends StatefulWidget {
  static String tag="myevents-Page";
 @override
 State<StatefulWidget> createState() {
    return EventsScroll();
  }
}

  // Future<String> getPnrDetails() async{
  //   http.Response response = await http.get(
  //     Uri.encodeFull("http://businesstravel20180603032656.azurewebsites.net/api/Values"),
  //     headers:{
  //       "Accept" : "application/json"
  //     }
  //   );
  //   print(response.body);
  //   return response.body;
  // }

class EventsScroll extends State<MyEvents> {

  static final offers offersdata = new offers(
   
    images: <image>[ 
      new image(
        title: 'Jazz in the Garden Concert Series, On June 08, 2018',
        thumbnail: '../assets/Event_2.JPG',
        url: 'https://washington.org/event/jazz-garden-concert-series',
      ),
      new image(
        title: 'DC Jazz Festival, From June 8-17, 2018',
        thumbnail: '../assets/Event_2.jpg',
        url: 'https://washington.org/visit-dc/reasons-to-attend-dc-jazz-festival',
      ),
      new image(
        title: 'Experience a creativity, From June 21-24, 2018',
        thumbnail: '../assets/Event_3.jpg',
        url: 'https://washington.org/visit-dc/discover-by-the-people-festival',
      ),
      new image(
        title: 'Girlfriend , Signature Theatre, From June 10, 2018',
        thumbnail: '../assets/Event_4.jpg',
        url: 'https://washington.org/event/girlfriend-matthew-sweet-and-todd-almond',
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    
    return new Scaffold(
        appBar: new AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print('Menu button');
            },
          ),
          title: new Text("Events")
      ),
      body: new OffersPage(offersdata),
    );
  }
}