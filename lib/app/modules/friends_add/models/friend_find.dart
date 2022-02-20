class FriendFind {
  FriendFind({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataFriendFind> data;

  FriendFind.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        List.from(json['data']).map((e) => DataFriendFind.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataFriendFind {
  DataFriendFind({
    required this.IsFriend,
    required this.Id,
    this.Fullname,
    required this.MemberLevel,
  });
  late final bool IsFriend;
  late final String Id;
  late final String? Fullname;
  late final String MemberLevel;

  DataFriendFind.fromJson(Map<String, dynamic> json) {
    IsFriend = json['IsFriend'];
    Id = json['Id'];
    Fullname = null;
    MemberLevel = json['MemberLevel'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['IsFriend'] = IsFriend;
    _data['Id'] = Id;
    _data['Fullname'] = Fullname;
    _data['MemberLevel'] = MemberLevel;
    return _data;
  }
}
