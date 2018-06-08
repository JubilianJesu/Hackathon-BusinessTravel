
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/offers.dart';
import '../scroller/OfferPage.dart';

class MyEvents extends StatefulWidget {
  static String tag="myevents-Page";
 @override
 State<StatefulWidget> createState() {
    return EventsScroll();
  }
}

class EventsScroll extends State<MyEvents> {

  static final offers offersdata = new offers(
   
    images: <image>[ 
      new image(
        title: 'Jazz in the Garden Concert Series, June 08, 2018 From: 05:00 PM to 08:30 PM',
        thumbnail: 'assets/Event_1.JPG',
        url: 'https://washington.org/event/jazz-garden-concert-series',
      ),
      new image(
        title: 'DC Jazz Festival, From June 8-17, 2018',
        thumbnail: 'assets/Event_2.jpg',
        url: 'https://washington.org/visit-dc/reasons-to-attend-dc-jazz-festival',
      ),
      new image(
        title: 'Experience a celebration of creativity and compassion through interactive exhibits, From June 21-24, 2018',
        thumbnail: 'assets/Event_3.jpg',
        url: 'https://washington.org/visit-dc/discover-by-the-people-festival',
      ),
      new image(
        title: 'Girlfriend by Matthew Sweet and Todd Almond, Signature Theatre, 4200 Campbell Ave From June 10, 2018',
        thumbnail: 'assets/Event_4.jpg',
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