class NewsDetail {
  NewsDetail({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataNewsDetail> data;

  NewsDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        List.from(json['data']).map((e) => DataNewsDetail.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataNewsDetail {
  DataNewsDetail({
    required this.Id,
    required this.Title,
    required this.Excerpt,
    required this.Content,
    required this.BannerImage,
    required this.Created,
  });
  late final String Id;
  late final String Title;
  late final String Excerpt;
  late final String Content;
  late final String BannerImage;
  late final String Created;

  DataNewsDetail.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Title = json['Title'];
    Excerpt = json['Excerpt'];
    Content = json['Content'];
    BannerImage = json['BannerImage'];
    Created = json['Created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Title'] = Title;
    _data['Excerpt'] = Excerpt;
    _data['Content'] = Content;
    _data['BannerImage'] = BannerImage;
    _data['Created'] = Created;
    return _data;
  }
}
