import 'package:flutter/material.dart';

class View_member extends StatefulWidget {
  const View_member({ Key? key }) : super(key: key);

  @override
  State<View_member> createState() => _View_memberState();
}

class _View_memberState extends State<View_member> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Member'),
        backgroundColor: Color.fromARGB(255, 82, 158, 89),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 174, 179, 174),
      
      body: Container(

      ),
    );
  }
}