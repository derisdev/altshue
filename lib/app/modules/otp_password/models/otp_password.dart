class OTPPassword {
  OTPPassword({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Data data;

  OTPPassword.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.MemberId,
  });
  late final String MemberId;

  Data.fromJson(Map<String, dynamic> json) {
    MemberId = json['MemberId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MemberId'] = MemberId;
    return _data;
  }
}
