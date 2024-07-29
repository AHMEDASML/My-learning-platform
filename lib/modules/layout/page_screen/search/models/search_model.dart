

class SearchModel {
  final bool success;
  final List<Datum> data;
  final String message;

  SearchModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    success: json["success"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  final int id;
  final String nameCourse;
  final String price;
  final String logo;
  final dynamic nameMaster;

  Datum({
    required this.id,
    required this.nameCourse,
    required this.price,
    required this.logo,
    required this.nameMaster,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    nameCourse: json["name_course"],
    price: json["price"],
    logo: json["logo"],
    nameMaster: json["name_master"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_course": nameCourse,
    "price": price,
    "logo": logo,
    "name_master": nameMaster,
  };
}
