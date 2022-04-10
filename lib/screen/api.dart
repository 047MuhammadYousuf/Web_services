import 'dart:convert';
import 'package:http/http.dart' as http;

getmembers() async {
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
    return calldatascreen;
  } catch (e) {
    print("   error catch $e");
  }
}

class Calldata {
  int? id;
  String? qrCode;
  String? fullName;
  String? relation;

  Calldata({this.id, this.qrCode, this.fullName, this.relation});
}

Future deletemember(String id) async {
  final http.Response response = await http.delete(
    Uri.parse('https://member-api.herokuapp.com/member/delete/$id'),
  );

  if (response.statusCode == 200) {
    print("$response");
    // return response;
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}

Future updateAlbum1(id, qrCode, fullName, relation) async {
  // final response = await http.put(
  //   Uri.parse('https://member-api.herokuapp.com/member/update/$id'),
  //   body: jsonEncode({
  //     {"fullName": "$qrCode", "qrCode": "$fullName", "relation": "$relation"}
  //   }),
  // );
  final response = await http.put(
      Uri.parse('https://member-api.herokuapp.com/member/update/$id'),
      body: jsonEncode({
        'fullName': '$qrCode',
        'qrCode': '$fullName',
        'relation': '$relation',
      }));

  if (response.statusCode == 200) {
    print("$response");
    // return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}

Future updateAlbum(id, qrCode, fullName, relation) async {
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
    // return jsonDecode(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}
