import 'package:get_storage/get_storage.dart';

void saveToken(String token) {
  final box = GetStorage();
  box.write('token', token);
}

String? getToken() {
  final box = GetStorage();
  return box.read('token');
}

void saveStep(int step) {
  final box = GetStorage();
  box.write('step', step);
}

String? getStep() {
  final box = GetStorage();
  return box.read('step');
}

void saveKtpVerified(bool verified) {
  final box = GetStorage();
  box.write('ktp_verified', verified);
}

bool? getKtpVerified() {
  final box = GetStorage();
  return box.read('ktp_verified');
}

void clearStorage() {
  final box = GetStorage();
  box.erase();
}
