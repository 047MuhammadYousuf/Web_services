import 'package:flutter/material.dart';
import 'package:web_services/screen/home..dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF009C10),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF009C10),
        title: const Text(""),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.02,
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 8,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                  border: Border.all(color: Colors.transparent)),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Details",
                      style: TextStyle(
                          fontSize: 29,
                          fontWeight: FontWeight.w700,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Name',
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Relationship',
                          )),
                    ),
                    // Container(
                    //   padding: EdgeInsets.all(10),
                    //   child: TextField(
                    //       cursorColor: Colors.green,
                    //       decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         labelText: 'Area',
                    //       )),
                    // ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  MediaQuery.of(context).size.width * 0.05),
                            ),
                            minimumSize: Size(
                                20,
                                MediaQuery.of(context).size.height *
                                    0.06) // put the width and height you want
                            ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => Home()),
                              (Route<dynamic> route) => route is Home);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
