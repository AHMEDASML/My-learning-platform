// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  final bool success;
  final Data data;
  final String message;

  HomeModel({
    required this.success,
    required this.data,
    required this.message,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
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
  final List<Ad> ads;
  final List<MyCourse> myCourses;
  final List<LatestCourse> latestCourses;
  final List<LatestLesson> latestLessons;

  Data({
    required this.ads,
    required this.myCourses,
    required this.latestCourses,
    required this.latestLessons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    ads: List<Ad>.from(json["ads"].map((x) => Ad.fromJson(x))),
    myCourses: List<MyCourse>.from(json["myCourses"].map((x) => MyCourse.fromJson(x))),
    latestCourses: List<LatestCourse>.from(json["latestCourses"].map((x) => LatestCourse.fromJson(x))),
    latestLessons: List<LatestLesson>.from(json["latestLessons"].map((x) => LatestLesson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ads": List<dynamic>.from(ads.map((x) => x.toJson())),
    "myCourses": List<dynamic>.from(myCourses.map((x) => x.toJson())),
    "latestCourses": List<dynamic>.from(latestCourses.map((x) => x.toJson())),
    "latestLessons": List<dynamic>.from(latestLessons.map((x) => x.toJson())),
  };
}

class Ad {
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final String image;

  Ad({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.image,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => Ad(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "title": title,
    "image": image,
  };
}

class LatestCourse {
  final int id;
  final String cover;
  final String nameLesson;
  final String nameCourse;
  final String nameMaster;
  final String price;

  LatestCourse({
    required this.id,
    required this.cover,
    required this.nameLesson,
    required this.nameCourse,
    required this.nameMaster,
    required this.price,
  });

  factory LatestCourse.fromJson(Map<String, dynamic> json) => LatestCourse(
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

class LatestLesson {
  final int id;
  final String imageLesson;
  final String nameLesson;
  final String nameSection;

  LatestLesson({
    required this.id,
    required this.imageLesson,
    required this.nameLesson,
    required this.nameSection,
  });

  factory LatestLesson.fromJson(Map<String, dynamic> json) => LatestLesson(
    id: json["id"],
    imageLesson: json["image_lesson"],
    nameLesson: json["name_lesson"],
    nameSection: json["name_section"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_lesson": imageLesson,
    "name_lesson": nameLesson,
    "name_section": nameSection,
  };
}

class MyCourse {
  final int id;
  final String cover;
  final String nameLesson;
  final String nameCourse;
  final String nameMaster;
  final String price;

  MyCourse({
    required this.id,
    required this.cover,
    required this.nameLesson,
    required this.nameCourse,
    required this.nameMaster,
    required this.price,
  });

  factory MyCourse.fromJson(Map<String, dynamic> json) => MyCourse(
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
