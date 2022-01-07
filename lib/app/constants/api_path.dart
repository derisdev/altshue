abstract class ApiPath {
  //Global
  static const baseUrl = 'https://altshue.id/api/api';

  //member
  static const baseUrlMember = baseUrl + '/member';
  static const register = baseUrlMember + '/add';
  static const ektp = baseUrlMember + '/ektp';
  static const dataUpdate = baseUrlMember + '/data_update';
  static const login = baseUrlMember + '/login';
  static const password = baseUrlMember + '/password';
  static const activityAdd = baseUrlMember + '/activity_add';
  static const resetPassword = baseUrlMember + '/reset_password';
  static const confirmPassword = baseUrlMember + '/confirm_password';

  //mission
  static const baseUrlMission = baseUrl + '/mission';
  static const check = baseUrlMission + '/check';
  static const listMission = baseUrlMission + '/list?mission_type=3';

  //friend req
  static const baseUrlReq = baseUrl + '/request';
  static const friendReq = baseUrlReq + '/friend';
  static const confirmReq = baseUrlReq + '/confirm';
  static const unfriend = baseUrlReq + '/unfriend';
  static const findFriend = baseUrl + '/find/friend';

  //friend
  static const baseUrlFriend = baseUrl + '/friend';
  static const listFriend = baseUrlFriend + '/list';
}
