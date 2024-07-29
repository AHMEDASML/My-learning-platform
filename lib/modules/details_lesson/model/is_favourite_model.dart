
class IsFavouriteModel {
  final bool success;
  final bool data;
  final String message;

  IsFavouriteModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory IsFavouriteModel.fromJson(Map<String, dynamic> json) => IsFavouriteModel(
    success: json["success"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data,
    "message": message,
  };
}
