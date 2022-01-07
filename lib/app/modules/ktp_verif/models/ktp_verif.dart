class KTPVerif {
  KTPVerif({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<dynamic>? data;

  KTPVerif.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = status != 200 ? null : List.castFrom<dynamic, dynamic>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data;
    return _data;
  }
}
