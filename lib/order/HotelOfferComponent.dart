import 'package:flutter/material.dart';
import 'HotelOfferModel.dart';

class HotelOfferComponent extends StatelessWidget {
  const HotelOfferComponent(
      {Key key, this.offerId, this.hotel, this.selected = false, this.onTap})
      : super(key: key);
  final String offerId;
  final VoidCallback onTap;
  final Hotel hotel;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    Color backColor = Colors.white;
    double _tickOpacity = 0.0;
    double _tickIconWidth = 0.0;
    double _labelWidth = 193.3;
    Color _labelColor = Colors.black54;
    if (selected) {
      backColor = Colors.deepPurpleAccent;
      _tickOpacity = 1.0;
      _labelWidth = 170.4;
      _tickIconWidth = 22.8;
      _labelColor = Colors.white;
    }
    return new GestureDetector(
      child: new Container(
        color: backColor,
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
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Container(
                          width: _labelWidth,
                          child: new Text(
                            hotel.name,
                            style: new TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: _labelColor),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                        new Container(
                          width: _tickIconWidth,
                          child: new Opacity(
                            opacity: _tickOpacity,
                            child: new Icon(
                              Icons.check_circle,
                              size: 23.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
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
//                        new Container(
//                          margin: const EdgeInsets.only(bottom: 5.0),
//                          child: buildHotelAmenities(context, hotel.amenities),
//                        )
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
                                    fontSize: 14.0, color: Colors.black54),
                              )),
                          new Container(
                            margin: const EdgeInsets.only(right: 5.0),
                            child: new Row(
                              children: <Widget>[
                                new Text(hotel.distance,
                                  style: new TextStyle(fontSize: 15.0),
                                ),
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
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }

  Widget buildHotelStarRating(BuildContext context, int rating) {
    List<Widget> widStarRating = new List<Widget>();
    for (int i = 0; i < rating; i++) {
      var widStar = new Container(
        child: new Icon(
          Icons.star,
          color: Colors.orange,
          size: 20.0,
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
}
