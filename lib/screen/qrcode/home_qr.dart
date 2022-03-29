import 'package:flutter/material.dart';
import 'package:web_services/screen/qrcode/qr_create.dart';
import 'package:web_services/screen/qrcode/qr_scan.dart';

import 'widgets.dart';

class QRHomeScreen extends StatefulWidget {
  const QRHomeScreen({Key? key}) : super(key: key);

  @override
  State<QRHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<QRHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        resizeToAvoidBottomInset: false,
        appBar: appbar("QR Screen",
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 130, 180, 73),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    )),
                onPressed: () {
                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QrCodeGenerator()));
                  });
                },
                child:  Text("QR code generator",
                style: TextStyle(fontSize:  MediaQuery.of(context).size.width * 0.05),
                )
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QrScanner()));
                },
                child:  Text("QR code Scanner",
                style: TextStyle(fontSize:  MediaQuery.of(context).size.width * 0.05),
                )),
          ],
        ),
      ),
    );
  }
}
