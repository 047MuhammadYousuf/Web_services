import 'package:flutter/material.dart';
import 'package:web_services/screen/qrcode/widgets.dart';

class Setting_ForgetPassword extends StatefulWidget {
  const Setting_ForgetPassword({Key? key}) : super(key: key);

  @override
  State<Setting_ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<Setting_ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
        backgroundColor: Color(0xFF009C10),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 164, 223, 166),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.93,
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.06,
                    bottom: MediaQuery.of(context).size.height * 0.09,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/Setting.jpg',
                    width: MediaQuery.of(context).size.width * 0.35,
                  )),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.025),
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Recovery Password",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Enter Recovery Password',
                    )),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 109, 204, 248),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ResetAnimation()));
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
