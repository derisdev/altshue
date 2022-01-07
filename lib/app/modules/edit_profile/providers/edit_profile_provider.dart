import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/edit_profile/models/edit_profile.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:dio/dio.dart';

class EditProfileProvider {
  Future<EditProfile> editProfile({required FormData dataEditProfile}) async {
    Dio dio = Dio();
    dio.options.headers['x-token'] = getToken();
    try {
      var response = await dio.post(ApiPath.ektp, data: dataEditProfile);
      print(response.statusCode);
      print(response.data);
      return EditProfile.fromJson(response.data);
    } catch (e) {
      print('error:: ${e.toString()}');
    }
    return EditProfile.fromJson({});
  }
}
