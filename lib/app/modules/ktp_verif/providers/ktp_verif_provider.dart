import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/ktp_verif/models/ktp_verif.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:http/http.dart' as http;

class KTPVerifProvider {
  // Future<KTPVerif> kTPVerif({required FormData dataKTPVerif}) async {
  //   Dio dio = Dio();
  //   dio.options.headers['x-token'] = getToken();
  //   try {
  //     var response = await dio.post(ApiPath.ektp, data: dataKTPVerif);
  //     print(response.statusCode);
  //     print(response.data);
  //     return KTPVerif.fromJson(response.data);
  //   } catch (e) {
  //     print('error:: ${e.toString()}');
  //   }
  //   return KTPVerif.fromJson({});
  // }
  Future<KTPVerif> kTPVerif(
      {required String eKtpId,
      required String address,
      required String filePath}) async {
    var url = Uri.parse(ApiPath.ektp);

    var request = http.MultipartRequest("POST", url);
    request.headers['x-token'] = getToken()!;
    request.fields['EktpId'] = eKtpId;
    request.fields['Address'] = address;
    request.files.add(await http.MultipartFile.fromPath(
      'Ektp',
      filePath,
      filename: filePath.split('/').last,
    ));
    var response = await request.send();
    if (response.statusCode == 200) {
      return KTPVerif.fromJson(
          {"status": 200, "message": "Yay,verifikasi Ektp sukses", "data": []});
    } else {
      return KTPVerif.fromJson(
          {"status": 404, "message": "Gagal upload ID Card", "data": []});
    }
  }
}
