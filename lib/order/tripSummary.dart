import 'package:flutter/material.dart';
import 'FlightCommonComponent.dart';
import 'FlightResultsModel.dart';
import 'HotelOfferModel.dart';
import 'RCOfferModel.dart';
import 'Confirmation.dart';

class TripSummary extends StatefulWidget {
  static String tag = "tripsummary-Page";
  @override
  State createState() => new TripSummaryState();
}

class TripSummaryState extends State<TripSummary> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            print('Menu button pressed');
            Navigator.pop(context);
          },
        ),
        title: new Text(
          'Trip Summary',
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: _buildBody(context),
    );
  }

  FlightCommonComponent component = new FlightCommonComponent();
  Widget _buildBody(BuildContext context) {
    return new Container(
        child: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
      buildTripSummary(context),
      buildHotelSection(context, getdummyHotelOffers()),
      buildRentalCarSection(context, getDummyRCOffers()),
      buildConfirmSection(context)
    ]));
  }

  Widget buildTripSummary(BuildContext context) {
    var flights = component.getDummySelectedFlights();
    List<Widget> widTrips = new List<Widget>();
    for (var i = 0; i < flights.length; i++) {
      widTrips.add(buildTripForSummary(context, flights[i]));
    }
    return new Container(
      child: new Column(
        children: widTrips,
      ),
    );
  }

  Widget buildTripForSummary(BuildContext context, Flight flight) {
    return new Container(
        decoration: BoxDecoration(
            border: const Border(
                bottom: const BorderSide(width: 0.8, color: Colors.grey))),
        child: new Row(
          children: <Widget>[
            new Container(
                height: 62.0,
                width: 73.5,
                //padding: const EdgeInsets.only(right: 4.0),
                decoration: const BoxDecoration(
                    border: const Border(
                        right:
                            const BorderSide(width: 0.8, color: Colors.grey))),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: 60.0,
                      child: new Text(
                        flight.departureDateFormatted,
                        style: new TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
            new Container(
              width: 337.5,
              padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
              // decoration: const BoxDecoration(
              //     border: const Border(
              //         right: const BorderSide(width: 0.8, color: Colors.grey))),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  component.buildTripDetails(context, flight),
                ],
              ),
            )
          ],
        ));
  }

  Widget buildHotelSection(BuildContext context, HotelOffers hotelOffers) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: new Row(
                    children: <Widget>[
                      new Text(
                        'Add Hotel to your trip',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        height: 18.0,
                        margin: const EdgeInsets.only(left: 5.0, top: 0.0),
                        child: new Icon(Icons.arrow_drop_down, size: 20.0,),
                      )
                    ],
                  ),
              ),
              new Container(
                width: 100.0,
                margin: const EdgeInsets.only(right: 8.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.blueAccent,
                    ),
                    new Flexible(
                      child: new Container(
                        //height: 30.0,
                        //width: 40.0,
                        child: new TextField(
                          //controller: widget._NameController,
                          maxLines: 1,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Den',
                              hintStyle: new TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Container(
            height: 181.0,
            child: new ListView(
                scrollDirection: Axis.horizontal,
                //margin: const EdgeInsets.only(top: 8.0),
                children: buildHotelCarousel(context, hotelOffers)),
          ),
        ],
      ),
    );
  }

  List<Widget> buildHotelCarousel(
      BuildContext context, HotelOffers hotelOffers) {
    List<Widget> lstWidHotels = new List<Widget>();
    for (int i = 0; i < hotelOffers.offers.length; i++) {
      lstWidHotels.add(buildHotelOffer(context, hotelOffers.offers[i]));
    }
    return lstWidHotels;
  }

  Widget buildHotelOffer(BuildContext context, Hotel hotel) {
    return new GestureDetector(
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(left: 2.0),
              decoration: const BoxDecoration(
                border: const Border(
                  top: const BorderSide(width: 0.8, color: Colors.grey),
                  right: const BorderSide(width: 0.8, color: Colors.grey),
                  bottom: const BorderSide(width: 0.8, color: Colors.grey),
                  left: const BorderSide(width: 0.8, color: Colors.grey),
                ),
              ),
              width: 200.0,
              height: 180.0,
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 26.0,
                    margin: const EdgeInsets.only(left: 5.0, top: 3.0),
                    child: new Text(
                      hotel.name,
                      style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  new Container(
                    height: 110.0,
                    width: 190.0,
                    margin: const EdgeInsets.only(bottom: 2.0),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(hotel.imagePath),
                          fit: BoxFit.cover),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(),
                        new Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          child: buildHotelAmenities(context, hotel.amenities),
                        )
                      ],
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: buildHotelStarRating(context, hotel.starRating),
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          new Container(
                              margin: const EdgeInsets.only(right: 5.0),
                              child: new Text(
                                hotel.price,
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colors.black54),
                              )),
                          new Container(
                            margin: const EdgeInsets.only(right: 5.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(hotel.distance),
                                // new Icon(
                                //   Icons.thumb_up,
                                //   color: Colors.blueAccent,
                                //   size: 18.0,
                                // ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHotelStarRating(BuildContext context, int rating) {
    List<Widget> widStarRating = new List<Widget>();
    for (int i = 0; i < rating; i++) {
      var widStar = new Container(
        child: new Icon(
          Icons.star,
          color: Colors.orange,
          size: 25.0,
        ),
      );
      widStarRating.add(widStar);
    }
    return new Container(
        child: new Row(
      children: widStarRating,
    ));
  }

  Widget buildHotelAmenities(BuildContext context, HotelAmenities amenities) {
    List<Widget> widAmenities = new List<Widget>();
    //     bool isBreakfastIncluded;
    // bool isRefundable;
    // bool isPetFriendly;
    // bool isWifi;
    // bool isSmokingAllowed;
    // bool isTV;
    // bool isBarAvailable;
    if (amenities.isWifi) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.wifi,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    if (amenities.isBreakfastIncluded) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.free_breakfast,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    if (amenities.isBarAvailable) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.local_bar,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    if (amenities.isSmokingAllowed) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.smoking_rooms,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    if (amenities.isTV) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.tv,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    if (amenities.isPetFriendly) {
      widAmenities.add(new Container(
        margin: const EdgeInsets.only(left: 2.0),
        child: new Icon(
          Icons.pets,
          color: Colors.white,
          size: 18.0,
        ),
      ));
    }
    return new Row(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
              //color: Colors.blue,
              ),
          child: new Row(
            children: widAmenities,
          ),
        )
      ],
    );
  }

  Widget buildRentalCarSection(BuildContext context, RCOffers rcOffers) {
    return new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                  margin:
                      const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        'Add Rental Car to your trip',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        height: 18.0,
                        margin: const EdgeInsets.only(left: 5.0, top: 0.0),
                        child: new Icon(Icons.arrow_drop_down, size: 20.0,),
                      )
                    ],
                  )),
              new Container(
                width: 100.0,
                margin: const EdgeInsets.only(right: 8.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.blueAccent,
                    ),
                    new Flexible(
                      child: new Container(
                        //height: 30.0,
                        //width: 40.0,
                        child: new TextField(
                          //controller: widget._NameController,
                          maxLines: 1,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Den',
                              hintStyle: new TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Container(
            height: 181.0,
            child: new ListView(
                scrollDirection: Axis.horizontal,
                //margin: const EdgeInsets.only(top: 8.0),
                children: buildRCCarousel(context, rcOffers)),
          ),
        ],
      ),
    );
  }

  List<Widget> buildRCCarousel(BuildContext context, RCOffers rcOffers) {
    List<Widget> lstWidCars = new List<Widget>();
    for (int i = 0; i < rcOffers.offers.length; i++) {
      lstWidCars.add(buildRCOffer(context, rcOffers.offers[i]));
    }
    return lstWidCars;
  }

  Widget buildRCOffer(BuildContext context, RentalCar car) {
    return new GestureDetector(
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(left: 2.0),
              decoration: const BoxDecoration(
                border: const Border(
                  top: const BorderSide(width: 0.8, color: Colors.grey),
                  right: const BorderSide(width: 0.8, color: Colors.grey),
                  bottom: const BorderSide(width: 0.8, color: Colors.grey),
                  left: const BorderSide(width: 0.8, color: Colors.grey),
                ),
              ),
              width: 200.0,
              height: 180.0,
              child: new Column(
                children: <Widget>[
                  new Container(
                    height: 26.0,
                    margin: const EdgeInsets.only(left: 5.0, top: 3.0),
                    child: new Text(
                      car.carName,
                      style: new TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  new Container(
                    height: 110.0,
                    width: 190.0,
                    margin: const EdgeInsets.only(bottom: 2.0),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(car.carImagePath),
                          fit: BoxFit.cover),
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(),
                        new Container(
                          margin: const EdgeInsets.only(bottom: 5.0),
                          //child: buildHotelAmenities(context, hotel.amenities),
                        )
                      ],
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 5.0, top: 8.0),
                        child: new Image.asset(
                          car.operatorLogoImagePath,
                          height: 20.0,
                        ),
                      ),
                      new Container(
                        child: buildRCAmenities(context, car.amenities),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRCAmenities(BuildContext context, RCAmenities amenities) {
    List<Widget> lstWidAmenities = new List<Widget>();
    double _iconSize = 18.0;
    Color _iconColor = Colors.black54;
    const _marginLeft = 5.0;
    if (amenities.isShuttle) {
      lstWidAmenities.add(new Container(
        //margin: const EdgeInsets.only(left: _marginLeft),
        child:
            new Icon(Icons.airport_shuttle, size: _iconSize, color: _iconColor),
      ));
    }
    if (amenities.seats != null) {
      lstWidAmenities.add(new Container(
        margin: const EdgeInsets.only(left: _marginLeft),
        child: new Row(
          children: <Widget>[
            new Container(
              child: new Icon(
                Icons.person,
                size: _iconSize,
                color: _iconColor,
              ),
            ),
            new Container(
              child: new Text(
                amenities.seats.toString(),
                style: new TextStyle(fontSize: 18.0, color: _iconColor),
              ),
            )
          ],
        ),
      ));
    }
    if (amenities.bags != null) {
      lstWidAmenities.add(new Container(
        margin: const EdgeInsets.only(left: _marginLeft),
        child: new Row(
          children: <Widget>[
            new Container(
              child: new Icon(
                Icons.card_travel,
                size: _iconSize,
                color: _iconColor,
              ),
            ),
            new Container(
              child: new Text(
                amenities.bags.toString(),
                style: new TextStyle(fontSize: 18.0, color: _iconColor),
              ),
            )
          ],
        ),
      ));
    }
    return new Container(
      margin: const EdgeInsets.only(top: 8.0, right: 5.0),
      child: new Row(
        children: lstWidAmenities,
      ),
    );
  }
  Widget buildConfirmSection(BuildContext context){   
    return new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 33.0),
      margin: const EdgeInsets.only(top: 8.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              width: 350.0,
              height: 40.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('Confirm',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white70),
                  textAlign: TextAlign.center),
            ),
            onTap: () {
              print('Confirm pressed');
              Navigator.of(context).pushNamed(Confirmation.tag);
            },
          )
        ],
      ),
    );
  }

  HotelOffers getdummyHotelOffers() {
    HotelOffers hOffers = new HotelOffers();
    hOffers.offers = new List<Hotel>();

    //-------------------------Hoteloffer1---------------------------
    var offer1 = new Hotel();
    offer1.name = "Sofitel Washington Inn Washington";
    offer1.imagePath = "assets/hotel_sofitel.jpg";
    offer1.distance = "2 miles";
    offer1.price = "+\$0";
    offer1.starRating = 5;
    offer1.amenities = new HotelAmenities();
    offer1.amenities.isWifi = true;
    offer1.amenities.isBreakfastIncluded = true;
    offer1.amenities.isSmokingAllowed = true;
    offer1.amenities.isTV = true;
    offer1.amenities.isBarAvailable = true;
    offer1.amenities.isRefundable = true;
    offer1.amenities.isPetFriendly = true;
    hOffers.offers.add(offer1);
    //---------------------------------------------------------------
    //-------------------------Hoteloffer2---------------------------
    var offer2 = new Hotel();
    offer2.name = "Hilton Hotel";
    offer2.imagePath = "assets/hotel_hilton.jpg";
    offer2.distance = "5 miles";
    offer2.price = "+\$0";
    offer2.starRating = 4;
    offer2.amenities = new HotelAmenities();
    offer2.amenities.isWifi = true;
    offer2.amenities.isBreakfastIncluded = true;
    offer2.amenities.isSmokingAllowed = true;
    offer2.amenities.isTV = true;
    offer2.amenities.isBarAvailable = true;
    offer2.amenities.isRefundable = true;
    offer2.amenities.isPetFriendly = true;
    hOffers.offers.add(offer2);
    //---------------------------------------------------------------
    //-------------------------Hoteloffer3---------------------------
    var offer3 = new Hotel();
    offer3.name = "Mandarin Oriental";
    offer3.imagePath = "assets/hotel_MandarinOriental.jpg";
    offer3.distance = "3 miles";
    offer3.price = "+\$0";
    offer3.starRating = 3;
    offer3.amenities = new HotelAmenities();
    offer3.amenities.isWifi = true;
    offer3.amenities.isBreakfastIncluded = true;
    offer3.amenities.isSmokingAllowed = true;
    offer3.amenities.isTV = true;
    offer3.amenities.isBarAvailable = false;
    offer3.amenities.isRefundable = true;
    offer3.amenities.isPetFriendly = true;
    hOffers.offers.add(offer3);
    //---------------------------------------------------------------
    //-------------------------Hoteloffer4---------------------------
    var offer4 = new Hotel();
    offer4.name = "Willard InterContinental";
    offer4.imagePath = "assets/hotel_WillardInterContinental.jpg";
    offer4.distance = "5 miles";
    offer4.price = "+\$100";
    offer4.starRating = 3;
    offer4.amenities = new HotelAmenities();
    offer4.amenities.isWifi = true;
    offer4.amenities.isBreakfastIncluded = true;
    offer4.amenities.isSmokingAllowed = false;
    offer4.amenities.isTV = true;
    offer4.amenities.isBarAvailable = false;
    offer4.amenities.isRefundable = true;
    offer4.amenities.isPetFriendly = true;
    hOffers.offers.add(offer4);
    //---------------------------------------------------------------
    return hOffers;
  }

  RCOffers getDummyRCOffers() {
    RCOffers rcOffers = new RCOffers();
    rcOffers.offers = new List<RentalCar>();
    //-------------------------rcoffer1------------------------------
    var offer1 = new RentalCar();
    offer1.offerId = "1";
    offer1.carName = "Toyota RAV4";
    offer1.carImagePath = "assets/SUVCar.jpg";
    offer1.operatorName = "Hertz";
    offer1.operatorLogoImagePath = "assets/Hertz_logo.png";
    offer1.price = "+\$0";
    offer1.address = "";
    offer1.starRating = 5;
    offer1.isBestOption = true;
    offer1.amenities = new RCAmenities();
    offer1.amenities.isFreeCancellation = true;
    offer1.amenities.isShuttle = true;
    offer1.amenities.seats = 5;
    offer1.amenities.bags = 3;
    rcOffers.offers.add(offer1);
    //---------------------------------------------------------------
    //-------------------------rcoffer2------------------------------
    var offer2 = new RentalCar();
    offer2.offerId = "2";
    offer2.carName = "Toyota Corolla";
    offer2.carImagePath = "assets/IntermediateCar.jpg";
    offer2.operatorName = "Budget";
    offer2.operatorLogoImagePath = "assets/Budget_logo.png";
    offer2.price = "+\$0";
    offer2.address = "";
    offer2.starRating = 5;
    offer2.isBestOption = true;
    offer2.amenities = new RCAmenities();
    offer2.amenities.isFreeCancellation = true;
    offer2.amenities.isShuttle = true;
    offer2.amenities.seats = 5;
    offer2.amenities.bags = 2;
    rcOffers.offers.add(offer2);
    //---------------------------------------------------------------
    //-------------------------rcoffer3------------------------------
    var offer3 = new RentalCar();
    offer3.offerId = "3";
    offer3.carName = "Toyota Camry";
    offer3.carImagePath = "assets/FullSizeCar.jpg";
    offer3.operatorName = "Enterprise";
    offer3.operatorLogoImagePath = "assets/Enterprise_logo.jpg";
    offer3.price = "+\$20";
    offer3.address = "";
    offer3.starRating = 5;
    offer3.isBestOption = false;
    offer3.amenities = new RCAmenities();
    offer3.amenities.isFreeCancellation = true;
    offer3.amenities.isShuttle = true;
    offer3.amenities.seats = 5;
    offer3.amenities.bags = 3;
    rcOffers.offers.add(offer3);
    //---------------------------------------------------------------
    //-------------------------rcoffer4------------------------------
    var offer4 = new RentalCar();
    offer4.offerId = "4";
    offer4.carName = "Chervolet Spark";
    offer4.carImagePath = "assets/SmallCar.jpg";
    offer4.operatorName = "Avis";
    offer4.operatorLogoImagePath = "assets/Avis_logo.jpg";
    offer4.price = "+\$0";
    offer4.address = "";
    offer4.starRating = 5;
    offer4.isBestOption = false;
    offer4.amenities = new RCAmenities();
    offer4.amenities.isFreeCancellation = false;
    offer4.amenities.isShuttle = true;
    offer4.amenities.seats = 4;
    offer4.amenities.bags = 2;
    rcOffers.offers.add(offer4);
    //---------------------------------------------------------------
    return rcOffers;
  }
}
