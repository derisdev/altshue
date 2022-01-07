import 'package:get_storage/get_storage.dart';

void saveToken(String token) {
  final box = GetStorage();
  box.write('token', token);
}

String? getToken() {
  final box = GetStorage();
  return box.read('token');
}
