import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/edit_profile/models/edit_profile.dart';
import 'package:get/get.dart';

class EditProfileProvider extends GetConnect {
  Future<EditProfile> editProfile({required Map dataEditProfile}) async {
    final response = await post(ApiPath.dataUpdate, dataEditProfile);
    print(response.body);
    return EditProfile.fromJson(response.body);
  }
}
