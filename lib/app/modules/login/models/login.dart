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
    required this.Token,
  });
  late final String Token;

  Data.fromJson(Map<String, dynamic> json) {
    Token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Token'] = Token;
    return _data;
  }
}
