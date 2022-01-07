import 'package:altshue/app/utils/services/local_storage.dart';

Map<String, String> headerApi() {
  return {'x-token': getToken()};
}
