class HotelOffers {
  List<Hotel> offers;
}

class Hotel {
  String offerId;
  String imagePath;
  String name;
  String distance;
  String price;
  String address;
  int starRating;
  bool isBestHotel = false;
  HotelAmenities amenities;
}

class HotelAmenities {
  bool isBreakfastIncluded = false;
  bool isRefundable = false;
  bool isPetFriendly = false;
  bool isWifi = false;
  bool isSmokingAllowed = false;
  bool isTV = false;
  bool isBarAvailable = false;
}
