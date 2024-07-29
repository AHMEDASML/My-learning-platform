
  class PlayVideoModel {
    final String videoUrl;

    PlayVideoModel({
      required this.videoUrl,
    });

    factory PlayVideoModel.fromJson(Map<String, dynamic> json) => PlayVideoModel(
      videoUrl: json["video_url"],
    );

    Map<String, dynamic> toJson() => {
      "video_url": videoUrl,
    };
  }
