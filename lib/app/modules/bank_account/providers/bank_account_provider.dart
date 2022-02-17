import 'dart:convert';

import 'package:altshue/app/constants/api_path.dart';
import 'package:altshue/app/modules/bank_account/models/bank_account.dart';
import 'package:altshue/app/utils/helpers/header_api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class BankAccountProvider extends GetConnect {
  Future<BankAccount> bankAccount({required Map dataBank}) async {
    var url = Uri.parse(ApiPath.bankAccount);
    var response = await http.post(url, body: dataBank, headers: headerApi());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return BankAccount.fromJson(json.decode(response.body));
  }
}
