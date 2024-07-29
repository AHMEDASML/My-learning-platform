
class DetailsLessonCoursesModel {
  final bool success;
  final List<Datum> data;
  final String message;

  DetailsLessonCoursesModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory DetailsLessonCoursesModel.fromJson(Map<String, dynamic> json) => DetailsLessonCoursesModel(
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
  final String cover;
  final String nameLesson;
  final String nameCourse;
  final String nameMaster;
  final String price;

  Datum({
    required this.id,
    required this.cover,
    required this.nameLesson,
    required this.nameCourse,
    required this.nameMaster,
    required this.price,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    cover: json["cover"],
    nameLesson: json["name_lesson"],
    nameCourse: json["name_course"],
    nameMaster: json["name_master"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cover": cover,
    "name_lesson": nameLesson,
    "name_course": nameCourse,
    "name_master": nameMaster,
    "price": price,
  };
}
