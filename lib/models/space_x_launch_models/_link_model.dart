class Links {
  Links({
    this.patch,
    this.reddit,
    this.flickr,
    this.presskit,
    this.webcast,
    this.youtubeId,
    this.article,
    this.wikipedia,
  });

  Patch? patch;
  Reddit? reddit;
  Flickr? flickr;
  String? presskit;
  String? webcast;
  String? youtubeId;
  String? article;
  String? wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
      );
}

class Flickr {
  Flickr({
    required this.small,
    required this.original,
  });

  List<dynamic> small;
  List<String> original;

  factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null
            ? []
            : List<dynamic>.from(json["small"].map((x) => x)),
        original: json["original"] == null
            ? []
            : List<String>.from(json["original"].map((x) => x)),
      );
}

class Patch {
  Patch({
    this.small,
    this.large,
  });

  String? small;
  String? large;

  factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
      );
}

class Reddit {
  Reddit({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  String? campaign;
  String? launch;
  String? media;
  String? recovery;

  factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
      );
}