import 'package:flutter/material.dart';
class Addmember extends StatelessWidget {
   Addmember({ Key? key }) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
          )
        ],
      ),
    );
  }
}