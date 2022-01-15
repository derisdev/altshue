class Account {
  Account({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final DataAccount data;

  Account.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = DataAccount.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataAccount {
  DataAccount({
    required this.Email,
    required this.Fullname,
    required this.Phone,
    required this.Photo,
  });
  late final String Email;
  late final String Fullname;
  late final String Phone;
  late final String Photo;

  DataAccount.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Fullname = json['Fullname'];
    Phone = json['Phone'];
    Photo = json['Photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Email'] = Email;
    _data['Fullname'] = Fullname;
    _data['Phone'] = Phone;
    _data['Photo'] = Photo;
    return _data;
  }
}
