import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:web_services/screen/add_new_member.dart';

class QrCodeGenerator extends StatefulWidget {
  const QrCodeGenerator({Key? key}) : super(key: key);

  @override
  State<QrCodeGenerator> createState() => _QrCodeGeneratorState();
}

class _QrCodeGeneratorState extends State<QrCodeGenerator> {
  TextEditingController datacontroller = TextEditingController();
  String data = "webservice";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text(
          "Scan to Join ",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Addmember()));
            },
            child: QrImage(data: data,
            size: 250,
            backgroundColor: Colors.white,
            ),
          ),
          // QrImage(
          //   data: data,
          //   size: 250,
          //   backgroundColor: Colors.white,
          // ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: TextField(
          //     controller: datacontroller,
          //     decoration: InputDecoration(
          //       hintText: "Write your data to generate Qr code..",
          //       hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          //       suffixIcon: IconButton(
          //           onPressed: () {
          //             setState(() {
          //               data = datacontroller.text;
          //               datacontroller.clear();
          //             });
          //           },
          //           icon: const Icon(
          //             Icons.check,
          //             color: Colors.black,
          //           )),
          //       enabledBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.blue, width: 2),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //       focusedBorder: OutlineInputBorder(
          //         borderSide: const BorderSide(color: Colors.blue, width: 2),
          //         borderRadius: BorderRadius.circular(10),
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
