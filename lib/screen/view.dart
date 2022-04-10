import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Createddata {
  Future datacreated(
    idno,
    fullname,
    qrcode,
    relation,
  ) async {
    final responce = await http
        .post(Uri.parse('https://member-api.herokuapp.com/member/save'),
            body: jsonEncode({
              "id": idno,
              "fullName": fullname,
              "qrCode": qrcode,
              "username": relation,
            }),
            headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    print(responce.statusCode);
    if (responce.statusCode == 201) {
      print('Data Created Successfully');
    } else {
      print('erro');
    }
  }
}

class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  Createddata obj = Createddata();
  TextEditingController idcontroller = TextEditingController();

  TextEditingController qrcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController relationcontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    getdata();
    datadelet(id);
    obj.datacreated(idcontroller.text, qrcontroller.text,
        fullnamecontroller.text, relationcontroller.text);
  }

  List data = [];
  String id = "";
  Future getdata() async {
    final responce = await http
        .get(Uri.parse('https://member-api.herokuapp.com/member/all'));
    if (responce.statusCode == 200) {
      setState(() {
        data = jsonDecode(responce.body);
      });
      print('Add data$data');
    } else {
      print('erro');
    }
  }

  Future datadelet(id) async {
    final responce = await http.delete(
        Uri.parse('https://member-api.herokuapp.com/member/delete/$id'));
    print(responce.statusCode);

    if (responce.statusCode == 200) {
      print('DELETE COMPLETE');
      getdata();
    } else {
      print('nOT dELET');
    }
  }

  Future update() async {
    final responce = await http
        .put(Uri.parse('https://member-api.herokuapp.com/member/update/1'),
            body: jsonEncode({
              "fullName": fullnamecontroller.text,
              "qrCode": qrcontroller.text,
              'relation': relationcontroller.text,
            }),
            headers: {
          'Content-type': 'application/json; charset=UTF-8',
        });
    print(responce.statusCode);
    if (responce.statusCode == 200) {
      print('Data Update Sucassfully');
      idcontroller.clear();
      qrcontroller.clear();
      fullnamecontroller.clear();
      relationcontroller.clear();
      getdata();
    } else {
      print('erro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: idcontroller,
                  decoration: InputDecoration(
                    hintText: 'id',
                  ),
                ),
                TextField(
                  controller: qrcontroller,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                TextField(
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'Number',
                  ),
                ),
                TextField(
                  controller: relationcontroller,
                  decoration: InputDecoration(
                    hintText: 'Number',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            obj.datacreated(
                                qrcontroller.text,
                                fullnamecontroller.text,
                                relationcontroller.text,
                                idcontroller.text);
                          });
                        },
                        child: Text('Submit')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            update();
                          });
                        },
                        child: Text('Update')),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ListTile(
                            title: Text(data[index]['qrCode']),
                            subtitle: Text(data[index]['qrCode']),
                            trailing: Container(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        qrcontroller.text =
                                            data[index]['qrCode'];
                                        fullnamecontroller.text =
                                            data[index]['qrCode'];
                                        relationcontroller.text =
                                            data[index]['qrCode'];
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          datadelet(data[index]['id']);
                                        });
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
