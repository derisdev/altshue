class Friend {
  Friend({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataFriend> data;

  Friend.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => DataFriend.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataFriend {
  DataFriend({
    required this.Id,
    this.Fullname,
    required this.MemberLevel,
  });
  late final String Id;
  late final String? Fullname;
  late final String MemberLevel;

  DataFriend.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Fullname = null;
    MemberLevel = json['MemberLevel'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Fullname'] = Fullname;
    _data['MemberLevel'] = MemberLevel;
    return _data;
  }
}
