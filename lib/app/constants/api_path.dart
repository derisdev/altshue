abstract class ApiPath {
  //Global
  static const baseUrl = 'https://altshue.id/api/api';

  //member
  static const baseUrlMember = baseUrl + '/member';
  static const login = baseUrlMember + '/login';
  static const register = baseUrlMember + '/add';
  static const ektp = baseUrlMember + '/ektp';
  static const memberData = baseUrlMember + '/profile';
  static const dataUpdate = baseUrlMember + '/data_update';
  static const updatePassword = baseUrlMember + '/password';
  static const activityAdd = baseUrlMember + '/activity_add';
  static const lupaPassword = baseUrlMember + '/reset_password';
  static const otpVerify = baseUrlMember + '/confirm_otp';
  static const resetNewPassword = baseUrlMember + '/confirm_password';

  //mission
  static const baseUrlMission = baseUrl + '/mission';
  static const missionList = baseUrlMission + '/list';
  static const missionAchievmentCheck = baseUrl + '/achievement/check';
  static const missionCheck = baseUrlMission + '/check';

  //friend req
  static const baseUrlReq = baseUrl + '/request';
  static const friendReq = baseUrlReq + '/friend';
  static const friendReqList = baseUrlReq + '/list';
  static const confirmReq = baseUrlReq + '/confirm';
  static const unfriend = baseUrlReq + '/unfriend';
  static const findFriend = baseUrl + '/find/friend';

  //friend
  static const baseUrlFriend = baseUrl + '/friend';
  static const listFriend = baseUrlFriend + '/list';

  //news
  static const news = baseUrl + '/article/list';
  static const newsDetail = baseUrl + '/article/detail';

  //contact
  static const getContact = baseUrl + '/get/contact';
  static const sendContact = baseUrl + '/send/contact';

  //redeem_history
  static const redeemHistory = baseUrl + '/gift/redeem_hist';

  //bug report
  static const bugError = baseUrl + '/bug/report';

  //bank account
  static const bankAccount = baseUrl + '/bank/account';
}
