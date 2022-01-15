import 'package:get_storage/get_storage.dart';

final box = GetStorage();

void saveToken(String token) {
  box.write('token', token);
}

String? getToken() {
  return box.read('token');
}

void saveStep(int step) {
  box.write('step', step);
}

int? getStep() {
  return box.read('step');
}

void saveDuration(int duration) {
  box.write('duration', duration);
}

int? getDuration() {
  return box.read('duration');
}

void saveDistance(double distance) {
  box.write('distance', distance);
}

double? getDistance() {
  return box.read('distance');
}

void eraseDataActivity() {
  box.remove('step');
  box.remove('duration');
  box.remove('distance');
}

void saveCurrentDay(int currentDay) {
  box.write('current_day', currentDay);
}

int? getCurrentDay() {
  return box.read('current_day');
}

void saveKtpVerified(bool verified) {
  box.write('ktp_verified', verified);
}

bool? getKtpVerified() {
  return box.read('ktp_verified');
}

void clearStorage() {
  box.erase();
}
