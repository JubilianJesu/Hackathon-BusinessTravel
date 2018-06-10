// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FlightResultsModel.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

FlightResultsData _$FlightResultsDataFromJson(Map<String, dynamic> json) =>
    new FlightResultsData()
      ..flightResults = json['flightResults'] == null
          ? null
          : new FlightResults.fromJson(
              json['flightResults'] as Map<String, dynamic>);

abstract class _$FlightResultsDataSerializerMixin {
  FlightResults get flightResults;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'flightResults': flightResults};
}

FlightResults _$FlightResultsFromJson(Map<String, dynamic> json) =>
    new FlightResults()
      ..trips = (json['trips'] as List)
          ?.map((e) => e == null
              ? null
              : new TripInfo.fromJson(e as Map<String, dynamic>))
          ?.toList();

abstract class _$FlightResultsSerializerMixin {
  List<TripInfo> get trips;
  Map<String, dynamic> toJson() => <String, dynamic>{'trips': trips};
}

TripInfo _$TripInfoFromJson(Map<String, dynamic> json) => new TripInfo()
  ..trip = (json['flights'] as List)
      ?.map((e) =>
          e == null ? null : new Flight.fromJson(e as Map<String, dynamic>))
      ?.toList();

abstract class _$TripInfoSerializerMixin {
  List<Flight> get trip;
  Map<String, dynamic> toJson() => <String, dynamic>{'flights': trip};
}

Flight _$FlightFromJson(Map<String, dynamic> json) => new Flight()
  ..origin = json['origin'] as String
  ..destination = json['destination'] as String
  ..departureDate = json['departureDate'] as String
  ..departureDateFormatted = json['departureDateFormatted'] as String
  ..arrivalDate = json['arrivalDate'] as String
  ..arrivalDateFormatted = json['arrivalDateFormatted'] as String
  ..departureTime = json['departureTime'] as String
  ..arrivalTime = json['arrivalTime'] as String
  ..carrierCode = json['carrierCode'] as String
  ..isBestFlight = json['isBestFlight'] as bool
  ..isNonStop = json['isNonStop'] as String
  ..travelTime = json['travelTime'] as String
  ..amenities = json['amenities'] == null
      ? null
      : new Amenities.fromJson(json['amenities'] as Map<String, dynamic>)
  ..connections = (json['connections'] as List)
      ?.map((e) =>
          e == null ? null : new Flight.fromJson(e as Map<String, dynamic>))
      ?.toList()
  ..priceToCollect = json['priceToCollect'] as String
  ..totalPrice = json['totalPrice'] as String;

abstract class _$FlightSerializerMixin {
  String get origin;
  String get destination;
  String get departureDate;
  String get departureDateFormatted;
  String get arrivalDate;
  String get arrivalDateFormatted;
  String get departureTime;
  String get arrivalTime;
  String get carrierCode;
  bool get isBestFlight;
  String get isNonStop;
  String get travelTime;
  Amenities get amenities;
  List<Flight> get connections;
  String get priceToCollect;
  String get totalPrice;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'origin': origin,
        'destination': destination,
        'departureDate': departureDate,
        'departureDateFormatted': departureDateFormatted,
        'arrivalDate': arrivalDate,
        'arrivalDateFormatted': arrivalDateFormatted,
        'departureTime': departureTime,
        'arrivalTime': arrivalTime,
        'carrierCode': carrierCode,
        'isBestFlight': isBestFlight,
        'isNonStop': isNonStop,
        'travelTime': travelTime,
        'amenities': amenities,
        'connections': connections,
        'priceToCollect': priceToCollect,
        'totalPrice': totalPrice
      };
}

Amenities _$AmenitiesFromJson(Map<String, dynamic> json) => new Amenities()
  ..isWifi = json['isWifi'] as bool
  ..isLegroom = json['isLegroom'] as bool
  ..isUSB = json['isUSB'] as bool
  ..isOnDemandVideo = json['isOnDemandVideo'] as bool
  ..isLounge = json['isLounge'] as bool;

abstract class _$AmenitiesSerializerMixin {
  bool get isWifi;
  bool get isLegroom;
  bool get isUSB;
  bool get isOnDemandVideo;
  bool get isLounge;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'isWifi': isWifi,
        'isLegroom': isLegroom,
        'isUSB': isUSB,
        'isOnDemandVideo': isOnDemandVideo,
        'isLounge': isLounge
      };
}
