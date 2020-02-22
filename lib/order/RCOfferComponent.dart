import 'package:flutter/material.dart';
import 'RCOfferModel.dart';

class RCOfferComponent extends StatelessWidget{
  const RCOfferComponent(
      {Key key,
      this.offerId,
      this.car,
      this.selected = false,
      this.onTap}): super(key: key);
  final String offerId;
  final VoidCallback onTap;
  final RentalCar car;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    Color backColor = Colors.white;
    double _tickOpacity = 0.0;
    double _tickIconWidth = 0.0;
    double _labelWidth = 193.3;
    Color _labelColor = Colors.black54;
    Color _iconColor = Colors.black54;
    if (selected) {
      backColor = Colors.deepPurpleAccent;
      _tickOpacity = 1.0;
      _labelWidth = 170.4;
      _tickIconWidth = 22.8;
      _labelColor = Colors.white;
      _iconColor = Colors.white;
    }
    return new GestureDetector(
      child: new Container(
        color: backColor,
        child: Row(
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
                            car.carName,
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
                        child:
//                        new Image.asset(
//                          car.operatorLogoImagePath,
//                          height: 20.0,
//                        ),
                          new Text('Complimentry',
                            style: new TextStyle(fontSize: 14.0),
                          ),
                      ),
                      new Container(
                          margin: const EdgeInsets.only(top: 10.0),
//                        child: buildRCAmenities(context, car.amenities, _iconColor),
                          child: new Text(car.availability,
                              style: new TextStyle(
                                  fontSize: 16.0, color: Colors.black54)
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
  Widget buildRCAmenities(BuildContext context, RCAmenities amenities, Color _iconColor) {
    List<Widget> lstWidAmenities = new List<Widget>();
    double _iconSize = 18.0;
    //Color _iconColor = Colors.black54;
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
}