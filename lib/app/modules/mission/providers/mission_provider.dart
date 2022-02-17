import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/mission/models/mission_check.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MissionProvider extends GetConnect {
  // Future<MissionList> listMission({required String missionType}) async {
  //   final response = await get(ApiPath.missionList+missionType+'?missionType=$missionType', headers: headerApi());
  //   print(response.body);
  //   return MissionList.fromJson(response.body);
  // }

  Future<MissionCheck> checkMission({required String missionId}) async {
    var url = Uri.parse(ApiPath.missionCheck);
    var response = await http.post(url,
        body: {'mission_id': missionId}, headers: headerApi());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return MissionCheck.fromJson(json.decode(response.body));
  }

  // Future<AchievmentMission> checkAchievmentMission(
  //     {required String title}) async {
  //   var url = Uri.parse(ApiPath.missionAchievmentCheck);
  //   var response =
  //       await http.post(url, body: {'title': title}, headers: headerApi());
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');

  //   return AchievmentMission.fromJson(json.decode(response.body));
  // }
}
