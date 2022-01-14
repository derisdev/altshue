import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/home/models/acitivity.dart';
import 'package:http/http.dart' as http;

class HomeProvider {
  Future<AcitivitySave> acitivitySave({required Map dataActivity}) async {
    var url = Uri.parse(ApiPath.activityAdd);
    var response = await http.post(url, body: dataActivity);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return AcitivitySave.fromJson(json.decode(response.body));
  }
}
