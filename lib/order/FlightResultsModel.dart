import 'package:json_annotation/json_annotation.dart';
part 'FlightResultsModel.g.dart';

@JsonSerializable()
class FlightResultsData extends Object with _$FlightResultsDataSerializerMixin{
  FlightResults flightResults;

  FlightResultsData();

  factory FlightResultsData.fromJson(Map<String, dynamic> json) => _$FlightResultsDataFromJson(json);
}
@JsonSerializable()
class FlightResults extends Object with _$FlightResultsSerializerMixin{
  List<TripInfo> trips;

  FlightResults();

  factory FlightResults.fromJson(Map<String, dynamic> json) => _$FlightResultsFromJson(json);
}
@JsonSerializable()
class TripInfo extends Object with _$TripInfoSerializerMixin{
  @JsonKey(name: 'flights')
  List<Flight> trip;

  TripInfo();

  factory TripInfo.fromJson(Map<String, dynamic> json) => _$TripInfoFromJson(json);
}
@JsonSerializable()
class Flight extends Object with _$FlightSerializerMixin{
  String origin;
  String destination;
  String departureDate;
  String departureDateFormatted;
  String arrivalDate;
  String arrivalDateFormatted;
  String departureTime;
  String arrivalTime;
  String carrierCode;
  bool isBestFlight = false;
  String isNonStop;
  String travelTime;
  Amenities amenities;
  List<Flight> connections;
  String priceToCollect;
  String totalPrice;
  int flightStats;

  Flight();

  factory Flight.fromJson(Map<String, dynamic> json) => _$FlightFromJson(json);
}
@JsonSerializable()
class Amenities extends Object with _$AmenitiesSerializerMixin{
  bool isWifi = false;
  bool isLegroom = false;
  bool isUSB = false;
  bool isOnDemandVideo = false;
  bool isLounge = false;

  Amenities();

  factory Amenities.fromJson(Map<String, dynamic> json) => _$AmenitiesFromJson(json);
}
