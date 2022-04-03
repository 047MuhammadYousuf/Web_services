import 'package:flutter/material.dart';

class Addnewmember extends StatefulWidget {
  final String? text;
  Addnewmember({Key? key, @required this.text}) : super(key: key);

  @override
  State<Addnewmember> createState() => _Addnewmember();
}

class _Addnewmember extends State<Addnewmember> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Text("${widget.text}"),
    );
  }
}
