import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/edit_profile/models/edit_profile.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:http/http.dart' as http;

class EditProfileProvider {
  Future<EditProfile> editProfile(
      {required String filePath,
      required String fullName,
      required String email,
      required String phone}) async {
    var url = Uri.parse(ApiPath.dataUpdate);

    var request = http.MultipartRequest("POST", url);
    request.headers['x-token'] = getToken()!;

    request.fields['Email'] = email;
    request.fields['Phone'] = phone;
    request.fields['Fullname'] = fullName;
    if (filePath.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'Foto',
        filePath,
        filename: filePath.split('/').last,
      ));
    }
    var response = await request.send();
    // response.stream.listen((value) {
    //   print();
    // });
    print(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      return EditProfile.fromJson(
          {"status": 200, "message": "Yay,berhasil ubah data", "data": []});
    } else {
      return EditProfile.fromJson(
          {"status": 404, "message": "Gagal ubah data", "data": []});
    }
  }
}
