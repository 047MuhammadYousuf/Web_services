import 'package:flutter/material.dart';
import 'package:web_services/screen/api.dart';

class View_member extends StatefulWidget {
  const View_member({Key? key}) : super(key: key);

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
            FutureBuilder(
                future: getmembers(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    print("object  :null data  ${snapshot.data}");
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    print("object  :has data  ${snapshot.data[0].relation}");

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
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
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: ListTile(
                                  iconColor: Colors.red,
                                  // leading: iconname,
                                  title: Text(
                                      "${snapshot.data[index].fullName}",
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold)),
                                  subtitle: Text("date"),
                                  trailing: Column(children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        deletemember(
                                            "${snapshot.data[index].id}");
                                      },
                                      child: Icon(
                                        Icons.delete,
                                      ),
                                    )
                                  ]),
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  )));
                        });
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget view_member(context, iconcolor, name, date) {
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
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.bold)),
            subtitle: Text(date),
            trailing: Column(children: [
              SizedBox(
                height: 5,
              ),
              Icon(
                Icons.delete,
                // Text(
                //        ,
                //   style: TextStyle(fontWeight: FontWeight.bold),
                // ),
                // Text("Balance")
              )
            ]),
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )));
  }
}
