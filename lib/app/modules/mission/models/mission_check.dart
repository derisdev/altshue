class MissionCheck {
  MissionCheck({
    required this.status,
    required this.message,
    required this.data,
  });
  late final int status;
  late final String message;
  late final Data data;

  MissionCheck.fromJson(Map<String, dynamic> json) {
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
    required this.MissionTitle,
    required this.YourMissionHourProgress,
    required this.MaxMissionHourProgress,
    required this.YourMissionDistanceProgress,
    required this.MaxMissionDistanceProgress,
  });
  late final String MissionTitle;
  late final String YourMissionHourProgress;
  late final String MaxMissionHourProgress;
  late final String YourMissionDistanceProgress;
  late final String MaxMissionDistanceProgress;

  Data.fromJson(Map<String, dynamic> json) {
    MissionTitle = json['MissionTitle'];
    YourMissionHourProgress = json['YourMissionHourProgress'];
    MaxMissionHourProgress = json['MaxMissionHourProgress'];
    YourMissionDistanceProgress = json['YourMissionDistanceProgress'];
    MaxMissionDistanceProgress = json['MaxMissionDistanceProgress'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MissionTitle'] = MissionTitle;
    _data['YourMissionHourProgress'] = YourMissionHourProgress;
    _data['MaxMissionHourProgress'] = MaxMissionHourProgress;
    _data['YourMissionDistanceProgress'] = YourMissionDistanceProgress;
    _data['MaxMissionDistanceProgress'] = MaxMissionDistanceProgress;
    return _data;
  }
}
