// import 'package:flutter/material.dart';
// import 'package:macadress_gen/macadress_gen.dart';

// class Macadd extends StatefulWidget {
//   @override
//   _MacaddState createState() => _MacaddState();
// }

// class _MacaddState extends State<Macadd> {
//   MacadressGen macadressGen = MacadressGen();

//   String? mac;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MAC ADDRESS'),
//       ),
//       body: Center(
//           child: Text(
//         mac ?? 'MAC ',
//         style: TextStyle(
//             fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await getMAc();
//           setState(() {});
//         },
//       ),
//     );
//   }

//   Future getMAc() async {
//     mac = await macadressGen.getMac();
//   }
// }
