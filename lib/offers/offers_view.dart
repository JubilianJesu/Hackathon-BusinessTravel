
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/offers.dart';
import '../Scroller/OfferPage.dart';

class MyOffers extends StatefulWidget {
  static String tag="myoffers-Page";
 @override
 State<StatefulWidget> createState() {
    return OfferScroll();
  }
}

class OfferScroll extends State<MyOffers> {

  static final offers offersdata = new offers(
   
    images: <image>[
      new image(
        title: '15% Off - Fashion Ornaments',
        thumbnail: 'assets/Burberry_Offer.JPG',
        url: 'https://www.burberry.com/',
      ),
      new image(
        title: 'Free - Forbes Magazine',
        thumbnail: 'assets/Forbes_Offer.jpg',
        url: 'https://www.forbes.com',
      ),
      new image(
        title: 'Complementary Fragrance with Any \$400+Order',
        thumbnail: 'assets/MontBlanc_Offer.jpg',
        url: 'http://www.montblanc.com',
      ),
      new image(
        title: '10% Off - Starbucks',
        thumbnail: 'assets/Starbucks_Offer.jpg',
        url: 'https://www.starbucks.com/',
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
          title: new Text("My Offers")
      ),
      body: new OffersPage(offersdata),
    );
  }
}