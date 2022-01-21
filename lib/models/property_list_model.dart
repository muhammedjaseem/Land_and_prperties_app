// To parse this JSON data, do
//
//     final propertylistmodel = propertylistmodelFromJson(jsonString);

import 'dart:convert';

List<Propertylistmodel> propertylistmodelFromJson(String str) => List<Propertylistmodel>.from(json.decode(str).map((x) => Propertylistmodel.fromJson(x)));

String propertylistmodelToJson(List<Propertylistmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Propertylistmodel {
  Propertylistmodel({
    this.propertyId,
    this.propertName,
    this.propertyUseType,
    this.unitsCount,
    this.latitude,
    this.longitude,
    this.location,
    this.countryCode,
  });

  int? propertyId;
  String? propertName;
  PropertyUseType? propertyUseType;
  int? unitsCount;
  String? latitude;
  String? longitude;
  String? location;
  CountryCode? countryCode;

  factory Propertylistmodel.fromJson(Map<String, dynamic> json) => Propertylistmodel(
    propertyId: json["PropertyId"] == null ? null : json["PropertyId"],
    propertName: json["PropertName"] == null ? null : json["PropertName"],
    propertyUseType: json["PropertyUseType"] == null ? null : propertyUseTypeValues.map![json["PropertyUseType"]],
    unitsCount: json["UnitsCount"] == null ? null : json["UnitsCount"],
    latitude: json["Latitude"] == null ? null : json["Latitude"],
    longitude: json["Longitude"] == null ? null : json["Longitude"],
    location: json["Location"] == null ? null : json["Location"],
    countryCode: json["CountryCode"] == null ? null : countryCodeValues.map![json["CountryCode"]],
  );

  Map<String, dynamic> toJson() => {
    "PropertyId": propertyId == null ? null : propertyId,
    "PropertName": propertName == null ? null : propertName,
    "PropertyUseType": propertyUseType == null ? null : propertyUseTypeValues.reverse![propertyUseType],
    "UnitsCount": unitsCount == null ? null : unitsCount,
    "Latitude": latitude == null ? null : latitude,
    "Longitude": longitude == null ? null : longitude,
    "Location": location == null ? null : location,
    "CountryCode": countryCode == null ? null : countryCodeValues.reverse![countryCode],
  };
}

enum CountryCode { AE }

final countryCodeValues = EnumValues({
  "AE": CountryCode.AE
});

enum PropertyUseType { RESIDENTIAL, LABOUR_CAMP, MIXED_USE }

final propertyUseTypeValues = EnumValues({
  "Labour Camp": PropertyUseType.LABOUR_CAMP,
  "Mixed Use": PropertyUseType.MIXED_USE,
  "Residential": PropertyUseType.RESIDENTIAL
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
