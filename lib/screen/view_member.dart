import 'package:flutter/material.dart';
import 'package:web_services/screen/api.dart';

class View_member extends StatefulWidget {
  const View_member({Key? key}) : super(key: key);

  @override
  State<View_member> createState() => _View_memberState();
}

class _View_memberState extends State<View_member> {
  late Future _futuremember;
  TextEditingController name = TextEditingController();
  TextEditingController qr = TextEditingController();
  TextEditingController relation = TextEditingController();
  @override
  void initState() {
    super.initState();
    _futuremember = getmembers();
  }

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
                future: _futuremember,
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
                                    Wrap(children: [
                                      InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                    title: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Update Task",
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Icon(
                                                            Icons.cancel,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    actions: [
                                                      Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: TextField(
                                                              controller: name,
                                                              onChanged:
                                                                  (value) {},
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      'Full name'),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: TextField(
                                                              controller: qr,
                                                              onChanged:
                                                                  (value) {},
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      'Qr code'),
                                                            ),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 12),
                                                            child: TextField(
                                                              controller:
                                                                  relation,
                                                              onChanged:
                                                                  (value) {},
                                                              decoration: const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText:
                                                                      'relation'),
                                                            ),
                                                          ),
                                                          ElevatedButton.icon(
                                                              onPressed: () {
                                                                updateAlbum(
                                                                    "${snapshot.data[index].id}",
                                                                    qr.text,
                                                                    name.text,
                                                                    relation
                                                                        .text);
                                                                _futuremember =
                                                                    getmembers();
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              style: ElevatedButton
                                                                  .styleFrom(),
                                                              icon: Icon(
                                                                  Icons.check),
                                                              label: Text(
                                                                  "Update It")),
                                                        ],
                                                      )
                                                    ]);
                                              });
                                          // getmembers();
                                        },
                                        child: Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            deletemember(
                                                "${snapshot.data[index].id}");
                                            _futuremember = getmembers();
                                          });
                                          // getmembers();
                                        },
                                        child: Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ]),
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
