import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/home/models/acitivity.dart';
import 'package:get/get.dart';

class HomeProvider extends GetConnect {
  Future<AcitivitySave> acitivitySave({required Map dataActivity}) async {
    final response = await post(ApiPath.activityAdd, dataActivity);
    print(response.body);
    return AcitivitySave.fromJson(response.body);
  }
}
