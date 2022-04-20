import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future deletemember(String id) async {
  // DialogHelper.showLoading('Fetching data');
  EasyLoading.show(status: 'loading...');

  final http.Response response = await http.delete(
    Uri.parse('https://member-api.herokuapp.com/member/delete/$id'),
  );

  if (response.statusCode == 200) {
    print("$response");
    // return response;
    EasyLoading.dismiss();
  }
}
