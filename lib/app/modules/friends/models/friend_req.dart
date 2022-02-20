class FriendReq {
  FriendReq({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataFriendReq> data;

  FriendReq.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        List.from(json['data']).map((e) => DataFriendReq.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataFriendReq {
  DataFriendReq({
    required this.Id,
    required this.Fullname,
    required this.MemberLevel,
    required this.UniqueId,
  });
  late final String Id;
  late final String Fullname;
  late final String MemberLevel;
  late final String UniqueId;

  DataFriendReq.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Fullname = json['Fullname'];
    MemberLevel = json['MemberLevel'];
    UniqueId = json['UniqueId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Fullname'] = Fullname;
    _data['MemberLevel'] = MemberLevel;
    _data['UniqueId'] = UniqueId;
    return _data;
  }
}

class FriendConfirmDelete {
  FriendConfirmDelete({
    required this.status,
    required this.message,
  });
  late final int status;
  late final String message;

  FriendConfirmDelete.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}
