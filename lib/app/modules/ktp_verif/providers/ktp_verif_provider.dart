import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/ktp_verif/models/ktp_verif.dart';
import 'package:altshue/app/utils/services/local_storage.dart';
import 'package:dio/dio.dart';

class KTPVerifProvider {
  Future<KTPVerif> kTPVerif({required FormData dataKTPVerif}) async {
    Dio dio = Dio();
    dio.options.headers['x-token'] = getToken();
    try {
      var response = await dio.post(ApiPath.ektp, data: dataKTPVerif);
      print(response.statusCode);
      print(response.data);
      return KTPVerif.fromJson(response.data);
    } catch (e) {
      print('error:: ${e.toString()}');
    }
    return KTPVerif.fromJson({});
  }
}
