import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_services/screen/qrcode/loader.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

getmembers() async {
  // DialogHelper.showLoading('Fetching data');
  EasyLoading.show(status: 'loading...');

  try {
    final response = await http
        .get(Uri.parse('https://member-api.herokuapp.com/member/all'));
    var jsonData = jsonDecode(response.body);
    print(" Json Data ${jsonData.length}");
    print(" vList final object${jsonData}");
    // print(jsonData[0][0]['service_name']);
    List<Calldata> calldatascreen = [];
    // print(" calldatascreen : $calldatascreen");
    for (var i = 0; i < jsonData.length; i++) {
      Calldata servvices = Calldata(
        id: jsonData[i]['id'],
        qrCode: jsonData[i]['qrCode'],
        fullName: jsonData[i]['fullName'],
        relation: jsonData[i]['relation'],
      );
      calldatascreen.add(servvices);
    }

    print("List final is ${calldatascreen[0].fullName}");
    // DialogHelper.hideLoading();
    EasyLoading.dismiss();

    return calldatascreen;
  } catch (e) {
    print("   error catch $e");
  }
}

class Calldata {
  String? id;
  String? qrCode;
  String? fullName;
  String? relation;

  Calldata({this.id, this.qrCode, this.fullName, this.relation});
}

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

Future updatemember(id, qrCode, fullName, relation) async {
  EasyLoading.show(status: 'loading...');

  final response = await http.put(
      Uri.parse('https://member-api.herokuapp.com/member/update/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'fullName': '$qrCode',
        'qrCode': '$fullName',
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

Future createmember(qrCode, fullName, relation) async {
  EasyLoading.show(status: 'loading...');

  final response =
      await http.post(Uri.parse('https://member-api.herokuapp.com/member/save'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'fullName': '$qrCode',
            'qrCode': '$fullName',
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
