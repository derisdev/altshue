import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/ktp_verif/models/ktp_verif.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';

class KTPVerifProvider extends GetConnect {
  Future<KTPVerif> kTPVerif({required Map dataKTPVerif}) async {
    final response =
        await post(ApiPath.ektp, dataKTPVerif, headers: headerApi());
    print(response.body);
    return KTPVerif.fromJson(response.body);
  }
}
