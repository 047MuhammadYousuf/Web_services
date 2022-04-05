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
        title: Text('View Members'),
        backgroundColor: Color.fromARGB(255, 82, 158, 89),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 122, 206, 122),
      
      body: Container(
        child: ListView(
          children: [
            view_member(context,  Colors.red,"Muhammad Yousuf", "March 07,2022"),
            view_member(context,  Colors.red," Ahmed Imran",  "June 07,2020"),
            view_member(context,  Colors.red,"Anas Younus", "June 07,2020"),
          ],
        ),

      ),
    );
  }
Widget view_member(context,  iconcolor, name, date) {
  return Container(
    margin: EdgeInsets.only(top: 12, bottom: 12),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: ListTile(
      iconColor: iconcolor,
      // leading: iconname,
      title: Text(name,
          style:
          TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Column(children: [
        SizedBox(
          height: 5,
        ),  
        Icon(Icons.delete,
        // Text(
        //        ,
        //   style: TextStyle(fontWeight: FontWeight.bold),
        // ),
        // Text("Balance")
        )
      ]),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      )
    )
      );
    
}
}