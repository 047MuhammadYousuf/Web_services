import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String? text;
  Details({Key? key, @required this.text}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Text("${widget.text}"),
    );
  }
}
