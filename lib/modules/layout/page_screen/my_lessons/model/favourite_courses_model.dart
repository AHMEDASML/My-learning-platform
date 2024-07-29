
class FavouriteCoursesModel {
  final bool success;
  final Data data;
  final String message;

  FavouriteCoursesModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory FavouriteCoursesModel.fromJson(Map<String, dynamic> json) => FavouriteCoursesModel(
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
  final List<FavouriteCourse> favouriteCourses;

  Data({
    required this.favouriteCourses,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    favouriteCourses: List<FavouriteCourse>.from(json["favourite_courses"].map((x) => FavouriteCourse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "favourite_courses": List<dynamic>.from(favouriteCourses.map((x) => x.toJson())),
  };
}

class FavouriteCourse {
  final int id;
  final String cover;
  final dynamic nameLesson;
  final String nameCourse;
  final dynamic nameMaster;

  FavouriteCourse({
    required this.id,
    required this.cover,
    required this.nameLesson,
    required this.nameCourse,
    required this.nameMaster,
  });

  factory FavouriteCourse.fromJson(Map<String, dynamic> json) => FavouriteCourse(
    id: json["id"],
    cover: json["cover"],
    nameLesson: json["name_lesson"],
    nameCourse: json["name_course"],
    nameMaster: json["name_master"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cover": cover,
    "name_lesson": nameLesson,
    "name_course": nameCourse,
    "name_master": nameMaster,
  };
}
