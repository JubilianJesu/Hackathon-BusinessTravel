
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
        url: 'assets/Burberry_Offer.JPG',
        imageUrl: 'https://www.burberry.com/',
      ),
      new image(
        title: 'Free - Forbes Magazine',
        url: 'assets/Forbes_Offer.jpg',
        imageUrl: 'https://www.forbes.com',
      ),
      new image(
        title: 'Complementary Fragrance with Any \$400+Order',
        url: 'assets/MontBlanc_Offer.jpg',
        imageUrl: 'http://www.montblanc.com',
      ),
      new image(
        title: '10% Off - Starbucks',
        url: 'assets/Starbucks_Offer.jpg',
        imageUrl: 'https://www.starbucks.com/',
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