import 'package:flutter/material.dart';
import 'FlightCommonComponent.dart';
import 'FlightResultsModel.dart';
import 'HotelOfferModel.dart';
import 'RCOfferModel.dart';
import 'RentalWheelChair.dart';
import 'HotelOfferComponent.dart';
import 'RCOfferComponent.dart';
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
  String _selectedHotelOfferId = "";
  String _selectedRCOfferId = "";

  Widget _buildBody(BuildContext context) {
    return new Container(
        child: new ListView(scrollDirection: Axis.vertical, children: <Widget>[
          buildTitleMessageSection(context),
          buildTripSummary(context),
          buildMessageSection(context),
          buildFOWPromotionSection(context),
          buildConfirmFOWProgram(context),
//      buildHotelSection(context, getdummyHotelOffers()),
//      buildRentalCarSection(context, getDummyRCOffers()),
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
      decoration: BoxDecoration(
          border: const Border(
            top: const BorderSide(width: 0.8, color: Colors.grey),
          )),
      child: new Column(
        children: widTrips,
      ),
    );
  }

  Widget buildTripForSummary(BuildContext context, Flight flight) {
    double c_width = MediaQuery.of(context).size.width * 0.99;
    return new Container(
        decoration: BoxDecoration(
            border: const Border(
                bottom: const BorderSide(width: 0.8, color: Colors.grey),
                )),
        child: new Row(
          children: <Widget>[
            new Container(
              width: c_width,
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
            ),
          ],
        ));
  }

  Widget buildMessageSection(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.99;
    return new Container(
        padding: const EdgeInsets.only(bottom: 15.0),
        decoration: const BoxDecoration(
            border: const Border(
                bottom: const BorderSide(width: 1.0, color: Colors.grey))),
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 20.0, left: 3.0),
                width: c_width,
                child: new Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                      'Airport wheelchair assistance is avaiable and added for your trip. You will be provided wheelchair with assistance at check-in station.',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ))
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 20.0, left: 3.0),
                width: c_width,
                child: new Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                      'Note: Your inbound flight with fly time of 210 minutes does not have accessible lavatory. The request for Aisle wheelchair has been put for the flight.',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 18.0, color: Colors.red),
                      softWrap: true,
                    ))
                  ],
                ),
              ),
            ],
          ),
        ]));
  }

  Widget buildTitleMessageSection(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.99;
    return new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 20.0, left: 3.0),
                width: c_width,
                child: new Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                      'Review your trip summary',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                      softWrap: true,
                    ))
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(top: 20.0, left: 3.0, bottom: 15.0),
                width: c_width,
                child: new Row(
                  children: <Widget>[
                    Flexible(
                        child: new Text(
                      'Please review important instrunctions about your trip.',
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: new TextStyle(fontSize: 18.0),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ]));
  }

  Widget buildFOWPromotionSection(BuildContext context){
    double c_width = MediaQuery.of(context).size.width * 0.99;
    return new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    margin: const EdgeInsets.only(top: 25.0, left: 4.0, bottom: 20.0),
                    width: c_width,
                    child: new Row(
                      children: <Widget>[
                        Flexible(
                            child: new Text(
                              'Would you like to try our Freedom On Wheels program?',
                              textAlign: TextAlign.center,
                              style: new TextStyle(fontSize: 28.0),
                              softWrap: true,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ]));
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
                margin: const EdgeInsets.only(top: 20.0, left: 3.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      'Airport wheelchair assistance is avaiable and added for your trip.',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      'You can explore more options below.',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin:
                    const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 3.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      'Freedom of carrying wheel chair',
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontSize: 21.0, fontWeight: FontWeight.bold),
                    ),
                    /*new Container(
                      height: 18.0,
                      margin: const EdgeInsets.only(left: 5.0, top: 0.0),
                      child: new Icon(
                        Icons.arrow_drop_down,
                        size: 20.0,
                      ),
                    )*/
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 3.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      'Rent wheelchair for whole trip, you will be picked and dropped',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(bottom: 10.0, left: 3.0),
                child: new Row(
                  children: <Widget>[
                    new Text(
                      'off to place of your choice',
                      textAlign: TextAlign.left,
                      style: new TextStyle(fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Container(
                width: 100.0,
                margin:
                    const EdgeInsets.only(right: 8.0, top: 10.0, bottom: 10.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.deepPurpleAccent,
                    ),
                    new Flexible(
                      child: new Container(
                        //height: 30.0,
                        //width: 40.0,
                        child: new TextField(
                          //controller: widget._NameController,
                          maxLines: 1,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Pick Up',
                              hintStyle: new TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              new Container(
                width: 100.0,
                margin:
                    const EdgeInsets.only(right: 8.0, top: 10.0, bottom: 10.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Icon(
                      Icons.location_on,
                      size: 20.0,
                      color: Colors.deepPurpleAccent,
                    ),
                    new Flexible(
                      child: new Container(
                        //height: 30.0,
                        //width: 40.0,
                        child: new TextField(
                          //controller: widget._NameController,
                          maxLines: 1,
                          decoration: new InputDecoration.collapsed(
                              hintText: 'Drop Off',
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
      String offerId = hotelOffers.offers[i].offerId;
      lstWidHotels.add(new HotelOfferComponent(
        offerId: hotelOffers.offers[i].offerId,
        hotel: hotelOffers.offers[i],
        selected: _selectedHotelOfferId == offerId,
        onTap: () {
          setState(() {
            if (_selectedHotelOfferId == offerId) {
              _selectedHotelOfferId = "";
            } else {
              _selectedHotelOfferId = offerId;
            }
          });
        },
      ));
    }
    return lstWidHotels;
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
                      const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 1.0),
                  child: new Row(
                    children: <Widget>[
                      new Text(
                        'Or reserve wheel chair only for airport',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      new Container(
                        height: 18.0,
                        margin: const EdgeInsets.only(left: 5.0, top: 0.0),
                        child: new Icon(
                          Icons.arrow_drop_down,
                          size: 20.0,
                        ),
                      )
                    ],
                  )),
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
      var offerId = rcOffers.offers[i].offerId;
      lstWidCars.add(new RCOfferComponent(
        offerId: rcOffers.offers[i].offerId,
        car: rcOffers.offers[i],
        selected: _selectedRCOfferId == offerId,
        onTap: () {
          setState(() {
            if (_selectedRCOfferId == offerId) {
              _selectedRCOfferId = "";
            } else {
              _selectedRCOfferId = offerId;
            }
          });
        },
      ));
    }
    return lstWidCars;
  }

  Widget buildConfirmFOWProgram(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 55.0),
      margin: const EdgeInsets.only(top: 8.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              decoration: const BoxDecoration(color: Colors.deepPurple),
              width: 300.0,
              height: 40.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('I am interested',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center),
            ),
            onTap: () {
              print('Confirm pressed');
              Navigator.of(context).pushNamed(RentalWC.tag);
            },
          )
        ],
      ),
    );
  }
  Widget buildConfirmSection(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 55.0),
      margin: const EdgeInsets.only(top: 8.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              decoration: const BoxDecoration(color: Colors.grey),
              width: 300.0,
              height: 40.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('No, confirm my booking',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
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
    offer1.offerId = "1";
    offer1.name = "Battery MX12B";
    offer1.imagePath = "assets/hotel_sofitel.jpg";
    offer1.distance = "Available: 20";
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
    offer2.offerId = "2";
    offer2.name = "Battery MDX19B";
    offer2.imagePath = "assets/hotel_WillardInterContinental.jpg";
    offer2.distance = "Waitlist: 50";
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
    offer3.offerId = "3";
    offer3.name = "Battery RDX19B";
    offer3.imagePath = "assets/hotel_MandarinOriental.jpg";
    offer3.distance = "Available: 30";
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
    offer4.offerId = "4";
    offer4.name = "Battery DQX9B";
    offer4.imagePath = "assets/hotel_hilton.jpg";
    offer4.distance = "Waitlist: 5";
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
    offer1.carName = "Battery MDX32";
    offer1.carImagePath = "assets/hotel_hilton.jpg";
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
    offer2.carName = "Battery PB12";
    offer2.carImagePath = "assets/hotel_MandarinOriental.jpg";
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
    offer3.carName = "Battery YI39";
    offer3.carImagePath = "assets/hotel_WillardInterContinental.jpg";
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
    offer4.carName = "Battery UI34";
    offer4.carImagePath = "assets/hotel_sofitel.jpg";
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
// class HotelOfferComponent extends StatefulWidget{
//    const HotelOfferComponent(
//       {Key key,
//       @required this.offerId,
//       @required this.hotel,``
//       this.selected = false,
//       this.onTap}):super(key: key);

//   final String offerId;
//   final VoidCallback onTap;
//   final Hotel hotel;
//   final bool selected;
//   State createState() => new HotelOfferComponentState(key: key, offerId: offerId, hotel: hotel, onTap: onTap, selected: selected);
// }
