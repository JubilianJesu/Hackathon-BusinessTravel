class RCOffers {
  List<RentalCar> offers;
}

class RentalCar {
  String offerId;
  String carImagePath;
  String carName;
  String operatorName;
  String operatorLogoImagePath;
  String price;
  String address;
  int starRating;
  bool isBestOption = false;
  RCAmenities amenities;
}

class RCAmenities {
  bool isFreeCancellation = false;
  bool isShuttle = false;
  int seats;
  int bags;
}
