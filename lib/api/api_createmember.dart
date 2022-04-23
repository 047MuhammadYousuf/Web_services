import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

Future createmember(qrCode, fullName, relation) async {
  EasyLoading.show(status: 'loading...');

  final response =
      await http.post(Uri.parse('https://member-api.herokuapp.com/member/save'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'fullName': '$fullName',
            'qrCode': '$qrCode',
            'relation': '$relation',
          }));
  response;
  print("api call check data");
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("objecsnisdsdnisdsdit");
    print("${response.body}");
    EasyLoading.dismiss();

    // return jsonDecode(response.body);
  }
}
