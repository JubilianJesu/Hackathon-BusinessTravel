import 'package:flutter/material.dart';
import 'FlightCommonComponent.dart';
import 'FlightResultsModel.dart';
import 'HotelOfferModel.dart';
import 'RCOfferModel.dart';
import 'Confirmation.dart';
import 'HotelOfferComponent.dart';
import 'RCOfferComponent.dart';

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
                width: 65.0,
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
                      width: 50.0,
                      child: new Text(
                        flight.departureDateFormatted,
                        style: new TextStyle(fontSize: 15.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
            new Container(
              width: 290.5,
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
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 1.0),
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
                      child: new Icon(
                        Icons.arrow_drop_down,
                        size: 20.0,
                      ),
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
      String offerId = hotelOffers.offers[i].offerId;
      lstWidHotels.add(new HotelOfferComponent(
        offerId: hotelOffers.offers[i].offerId,
        hotel: hotelOffers.offers[i],
        selected: _selectedHotelOfferId == offerId,
        onTap: () {
          setState(() {
            if(_selectedHotelOfferId == offerId){
              _selectedHotelOfferId = "";
            }
            else{
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
                        'Add Rental Car',
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
      var offerId = rcOffers.offers[i].offerId;
      lstWidCars.add(new RCOfferComponent(
        offerId: rcOffers.offers[i].offerId,
        car: rcOffers.offers[i],
        selected: _selectedRCOfferId == offerId,
        onTap: () {
          setState(() {
            if(_selectedRCOfferId == offerId){
              _selectedRCOfferId = "";
            }
            else{
              _selectedRCOfferId = offerId;
            }
          });
        },
      ));
    }
    return lstWidCars;
  }

  Widget buildConfirmSection(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 33.0),
      margin: const EdgeInsets.only(top: 8.0),
      child: new Row(
        children: <Widget>[
          new GestureDetector(
            child: new Container(
              decoration: const BoxDecoration(color: Colors.red),
              width: 300.0,
              height: 40.0,
              padding: const EdgeInsets.only(top: 8.0),
              child: new Text('Confirm',
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
    offer2.offerId = "2";
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
    offer3.offerId = "3";
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
    offer4.offerId = "4";
    offer4.name = "Willard Inter Continental";
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

