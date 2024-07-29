
class RegModel {
  final bool success;
  final Data data;
  final String message;

  RegModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory RegModel.fromJson(Map<String, dynamic> json) => RegModel(
    success: json["success"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  final String token;
  final String name;
  final String numberUnified;
  final String phoneNumber;

  Data({
    required this.token,
    required this.name,
    required this.numberUnified,
    required this.phoneNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    token: json["token"],
    name: json["name"],
    numberUnified: json["number_unified"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "name": name,
    "number_unified": numberUnified,
    "phone_number": phoneNumber,
  };
}
