
class DetailsCourseModel {
  final int id;
  final String logo;
  final String cover;
  final String nameLesson;
  final String nameCourse;
  final String price;
  final List<ListVideo> listVideos;
  final bool isFavourite;

  DetailsCourseModel({
    required this.id,
    required this.logo,
    required this.cover,
    required this.nameLesson,
    required this.nameCourse,
    required this.price,
    required this.listVideos,
    required this.isFavourite,
  });

  factory DetailsCourseModel.fromJson(Map<String, dynamic> json) => DetailsCourseModel(
    id: json["id"],
    logo: json["logo"],
    cover: json["cover"],
    nameLesson: json["name_lesson"],
    nameCourse: json["name_course"],
    price: json["price"],
    listVideos: List<ListVideo>.from(json["list_videos"].map((x) => ListVideo.fromJson(x))),
    isFavourite: json["is_favourite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo": logo,
    "cover": cover,
    "name_lesson": nameLesson,
    "name_course": nameCourse,
    "price": price,
    "list_videos": List<dynamic>.from(listVideos.map((x) => x.toJson())),
    "is_favourite": isFavourite,
  };
}

class ListVideo {
  final int id;
  final String title;
  final int isFree;
  final int courseId;

  ListVideo({
    required this.id,
    required this.title,
    required this.isFree,
    required this.courseId,
  });

  factory ListVideo.fromJson(Map<String, dynamic> json) => ListVideo(
    id: json["id"],
    title: json["title"],
    isFree: json["is_free"],
    courseId: json["course_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "is_free": isFree,
    "course_id": courseId,
  };
}
