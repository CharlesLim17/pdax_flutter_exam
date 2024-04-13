import 'dart:convert';

PersonModel personModelFromJson(String str) =>
    PersonModel.fromJson(json.decode(str));

String personModelToJson(PersonModel data) => json.encode(data.toJson());

class PersonModel {
  String? status;
  int? code;
  int? total;
  List<Datum>? data;

  PersonModel({
    this.status,
    this.code,
    this.total,
    this.data,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) => PersonModel(
        status: json["status"],
        code: json["code"],
        total: json["total"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "total": total,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  DateTime? birthday;
  String? gender;
  Address? address;
  String? website;
  String? image;

  Datum({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
        website: json["website"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "birthday":
            "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "address": address?.toJson(),
        "website": website,
        "image": image,
      };
}

class Address {
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

  Address({
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
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
