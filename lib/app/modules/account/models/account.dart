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
}

class DataAccount {
  DataAccount({
    required this.Email,
    required this.Fullname,
    required this.Phone,
    required this.Photo,
    required this.ReferralCode,
    required this.gift,
  });
  late final String Email;
  late final String Fullname;
  late final String Phone;
  late final String Photo;
  late final String ReferralCode;
  late final Gift gift;

  DataAccount.fromJson(Map<String, dynamic> json) {
    Email = json['Email'];
    Fullname = json['Fullname'];
    Phone = json['Phone'];
    Photo = json['Photo'];
    ReferralCode = json['ReferralCode'];
    gift = Gift.fromJson(json['Gift']);
  }
}

class Gift {
  Gift({
    required this.Id,
    required this.Name,
    required this.AP,
    required this.UserType,
    required this.Created,
  });
  late final String Id;
  late final String Name;
  late final String AP;
  late final String UserType;
  late final String Created;

  Gift.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    AP = json['AP'];
    UserType = json['UserType'];
    Created = json['Created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Id'] = Id;
    _data['Name'] = Name;
    _data['AP'] = AP;
    _data['UserType'] = UserType;
    _data['Created'] = Created;
    return _data;
  }
}
