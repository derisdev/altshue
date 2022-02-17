class RedeemHistory {
  RedeemHistory({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final List<DataHistory> data;

  RedeemHistory.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e) => DataHistory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataHistory {
  DataHistory({
    required this.Id,
    required this.GiftId,
    required this.RedeemStatus,
    required this.RedeemDate,
    required this.UserId,
  });
  late final String Id;
  late final String GiftId;
  late final String RedeemStatus;
  late final String RedeemDate;
  late final String UserId;

  DataHistory.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    GiftId = json['GiftId'];
    RedeemStatus = json['RedeemStatus'];
    RedeemDate = json['RedeemDate'];
    UserId = json['UserId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['GiftId'] = GiftId;
    _data['RedeemStatus'] = RedeemStatus;
    _data['RedeemDate'] = RedeemDate;
    _data['UserId'] = UserId;
    return _data;
  }
}
