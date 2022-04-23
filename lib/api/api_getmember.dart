import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_easyloading/flutter_easyloading.dart';

getmembers() async {
  // DialogHelper.showLoading('Fetching data');

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
    // EasyLoading.dismiss();

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
