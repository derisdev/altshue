class Login {
  Login({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Data? data;

  Login.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = status != 200 ? null : Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  Data({
    required this.token,
  });
  late final String token;
  late final bool ektpVerified;

  Data.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    ektpVerified = json['EktpVerified'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Token'] = token;
    return _data;
  }
}
