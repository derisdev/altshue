import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/contact/models/contact.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ContactProvider extends GetConnect {
  Future<GetContact> getContact() async {
    final response = await get(ApiPath.getContact);
    print(response.body);
    return GetContact.fromJson(response.body);
  }

  Future<SendContact> sendContact({required Map dataContact}) async {
    var url = Uri.parse(ApiPath.sendContact);
    var response = await http.post(url, body: dataContact);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return SendContact.fromJson(json.decode(response.body));
  }
}
