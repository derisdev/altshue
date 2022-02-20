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
    required this.UniqueId,
    required this.FriendFollowerCount,
    required this.FriendLevel,
    required this.FriendFullname,
    required this.FriendPhoto,
  });
  late final String UniqueId;
  late final String FriendFollowerCount;
  late final String FriendLevel;
  late final String FriendFullname;
  late final String FriendPhoto;

  DataFriend.fromJson(Map<String, dynamic> json) {
    UniqueId = json['UniqueId'];
    FriendFollowerCount = json['FriendFollowerCount'];
    FriendLevel = json['FriendLevel'];
    FriendFullname = json['FriendFullname'];
    FriendPhoto = json['FriendPhoto'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UniqueId'] = UniqueId;
    _data['FriendFollowerCount'] = FriendFollowerCount;
    _data['FriendLevel'] = FriendLevel;
    _data['FriendFullname'] = FriendFullname;
    _data['FriendPhoto'] = FriendPhoto;
    return _data;
  }
}
