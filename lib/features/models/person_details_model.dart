// To parse this JSON data, do
//
//     final personDetailsModel = personDetailsModelFromJson(jsonString);

import 'dart:convert';

PersonDetailsModel personDetailsModelFromJson(String str) =>
    PersonDetailsModel.fromJson(json.decode(str));

String personDetailsModelToJson(PersonDetailsModel data) =>
    json.encode(data.toJson());

class PersonDetailsModel {
  int? id;
  String? street;
  String? streetName;
  String? buildingNumber;
  String? city;
  String? zipcode;
  String? country;
  String? countyCode;
  double? latitude;
  double? longitude;

  PersonDetailsModel({
    this.id,
    this.street,
    this.streetName,
    this.buildingNumber,
    this.city,
    this.zipcode,
    this.country,
    this.countyCode,
    this.latitude,
    this.longitude,
  });

  factory PersonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PersonDetailsModel(
        id: json["id"],
        street: json["street"],
        streetName: json["streetName"],
        buildingNumber: json["buildingNumber"],
        city: json["city"],
        zipcode: json["zipcode"],
        country: json["country"],
        countyCode: json["county_code"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "streetName": streetName,
        "buildingNumber": buildingNumber,
        "city": city,
        "zipcode": zipcode,
        "country": country,
        "county_code": countyCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
