class MovieModel {
  int id;
  int catId;
  String videoTitle;
  String videoThumbnail;

  MovieModel({this.id, this.catId, this.videoTitle, this.videoThumbnail});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    videoTitle = json['video_title'];
    videoThumbnail = json['video_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['video_title'] = this.videoTitle;
    data['video_thumbnail'] = this.videoThumbnail;
    return data;
  }

    static List<MovieModel> fromJsonList(List list) {
    if (list == null) return null;
    return list
        .map<MovieModel>((item) => MovieModel.fromJson(item))
        .toList();
  }
}