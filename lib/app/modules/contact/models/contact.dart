class GetContact {
  GetContact({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataGetContact> data;

  GetContact.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        List.from(json['data']).map((e) => DataGetContact.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataGetContact {
  DataGetContact({
    required this.Id,
    required this.Email,
    required this.Phone,
    required this.Address,
  });
  late final String Id;
  late final String Email;
  late final String Phone;
  late final String Address;

  DataGetContact.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Email = json['Email'];
    Phone = json['Phone'];
    Address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Email'] = Email;
    _data['Phone'] = Phone;
    _data['Address'] = Address;
    return _data;
  }
}

class SendContact {
  SendContact({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  SendContact.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
