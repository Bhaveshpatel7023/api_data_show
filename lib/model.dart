// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.name,
    required this.images,
    required this.gender,
    required this.species,
    this.homePlanet,
    required this.occupation,
    required this.sayings,
    required this.id,
    required this.age,
  });

  Name name;
  Images images;
  Gender gender;
  String species;
  String? homePlanet;
  String occupation;
  List<String> sayings;
  int id;
  String age;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    name: Name.fromJson(json["name"]),
    images: Images.fromJson(json["images"]),
    gender: genderValues.map[json["gender"]]!,
    species: json["species"],
    homePlanet: json["homePlanet"],
    occupation: json["occupation"],
    sayings: List<String>.from(json["sayings"].map((x) => x)),
    id: json["id"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "images": images.toJson(),
    "gender": genderValues.reverse[gender],
    "species": species,
    "homePlanet": homePlanet,
    "occupation": occupation,
    "sayings": List<dynamic>.from(sayings.map((x) => x)),
    "id": id,
    "age": age,
  };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "Male": Gender.MALE
});

class Images {
  Images({
    required this.headShot,
    required this.main,
  });

  String headShot;
  String main;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    headShot: json["head-shot"],
    main: json["main"],
  );

  Map<String, dynamic> toJson() => {
    "head-shot": headShot,
    "main": main,
  };
}

class Name {
  Name({
    required this.first,
    required this.middle,
    required this.last,
  });

  String first;
  String middle;
  String last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    first: json["first"],
    middle: json["middle"],
    last: json["last"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "middle": middle,
    "last": last,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
