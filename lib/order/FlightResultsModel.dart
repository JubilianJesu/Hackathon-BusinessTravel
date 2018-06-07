class FlightResults{
  List<Flight> flights;
}
class Flight{
  String origin;
  String destination;
  String departureDate;
  String arrivalDate;
  String departureTime;
  String arrivalTime;
  String carrierCode;
  bool isBestFlight;
  String isNonStop;
  String travelTime;
  Amenities amenities;
  Flight connection;
  String priceToCollect;
  String totalPrice;
}
class Amenities{
  bool isWifi = false;
  bool isLegroom = false;
  bool isUSB = false;
  bool isOnDemandVideo = false;
  bool isLounge = false;
}