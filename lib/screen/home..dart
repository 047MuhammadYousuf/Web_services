import 'dart:math';

import 'package:flutter/material.dart';
import 'package:web_services/main.dart';
import 'package:web_services/screen/lostmobile.dart';
import 'package:web_services/screen/mac-test.dart';
import 'package:web_services/screen/qrcode/home_qr.dart';
import 'package:web_services/screen/qrcode/qr_create.dart';
import 'package:web_services/screen/qrcode/qr_scan.dart';
import 'package:web_services/screen/setting.dart';
import 'package:web_services/screen/view_member.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'package:fluttertoast/fluttertoast.dart';
Color status = Color(0xff44D258);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EasyLoading.dismiss();

    Random objectname = Random();
    int number = objectname.nextInt(3);
    print(number);
    if (number == 0) {
      setState(() {
        status = Color(0xff44D258);
      });
    } else if (number == 1) {
      setState(() {
        status = Color.fromARGB(255, 210, 68, 68);
      });
    } else if (number == 2) {
      setState(() {
        status = Color.fromARGB(255, 1, 59, 250);
      });
    } else {
      setState(() {
        status = Color.fromARGB(255, 255, 0, 200);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 165, 234, 201),
        appBar: AppBar(
          backgroundColor: Color(0xFF009C10),
          title: Text('Home Screen'),
        ),
        body: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(3),
                        child: ElevatedButton(
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                              primary: status,
                            ),
                            child: Text("Status",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white))),
                      )),
                      // Expanded(
                      //     child: Container(
                      //   margin: EdgeInsets.all(3),
                      //   child: ElevatedButton(
                      //       onPressed: () {},
                      //       style: ElevatedButton.styleFrom(
                      //         primary: Colors.blue,
                      //       ),
                      //       child: Text(
                      //         "Red",
                      //         style: TextStyle(fontSize: 10),
                      //       )),
                      // )),
                      // Expanded(
                      //     child: Container(
                      //   margin: EdgeInsets.all(3),
                      //   child: ElevatedButton(
                      //       onPressed: () {

                      // // Navigator.push(context,MaterialPageRoute(builder: (context)=>_showDefaultToast()));

                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //         primary: Colors.red,
                      //       ),
                      //       child:
                      //           Text("Toast", style: TextStyle(fontSize: 10))),
                      // )),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.30,
                  bottom: MediaQuery.of(context).size.height * 0.0120,
                ),
                child: Text(
                  "System Status",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(''),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: status,
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             Setting_ForgetPassword()));
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Macadd()));
                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 3,
                              primary: Colors.green,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              )),
                          child: Text("Setting")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => View_member()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              )),
                          child: Text("View Members")),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        MyHomePage()),
                                (Route<dynamic> route) => route is MyHomePage);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                              )),
                          child: Text("Logout"))
                    ],
                  )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,s
                  //   children: [
                  //     Expanded(
                  //         child: Container(
                  //       margin: EdgeInsets.all(3),
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       Setting_ForgetPassword()));
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.blue,
                  //         ),
                  //         child: Text(
                  //           'Setting',
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     )),
                  //     // Expanded(
                  //     //     child: Container(
                  //     //   margin: EdgeInsets.all(3),
                  //     //   child: ElevatedButton(
                  //     //     onPressed: () {
                  //     //       Navigator.push(
                  //     //           context,
                  //     //           MaterialPageRoute(
                  //     //               builder: (context) => QrScanner()));
                  //     //     },
                  //     //     style: ElevatedButton.styleFrom(
                  //     //       primary: Colors.green,
                  //     //     ),
                  //     //     child: Text(
                  //     //       'Add  Member',
                  //     //       textAlign: TextAlign.center,
                  //     //     ),
                  //     //   ),
                  //     // )),
                  //     Expanded(
                  //         child: Container(
                  //       margin: EdgeInsets.all(3),
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) => View_member()));
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Colors.lightGreen,
                  //         ),
                  //         child: Text(
                  //           'View  Members',
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     )),
                  //     Expanded(
                  //         child: Container(
                  //       margin: EdgeInsets.all(3),
                  //       child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.pushAndRemoveUntil(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (BuildContext context) =>
                  //                       MyHomePage()),
                  //               (Route<dynamic> route) => route is MyHomePage);
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) => MyHomePage()));
                  //         },
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color.fromARGB(255, 63, 211, 211),
                  //         ),
                  //         child: Text(
                  //           'Logout',
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       ),
                  //     )),
                  //   ],
                  // ),

                  )
            ])));
  }
}
