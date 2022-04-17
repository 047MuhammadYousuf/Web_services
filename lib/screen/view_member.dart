import 'package:flutter/material.dart';
import 'package:web_services/screen/api.dart';
import 'package:web_services/screen/qrcode/qr_scan.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    final overlay = LoadingOverlay.of(context);

    var loading = false;

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
                    return Center(child: CircularProgressIndicator());
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
                                                            onPressed: loading
                                                                ? null
                                                                : () {
                                                                    setState(() =>
                                                                        loading =
                                                                            true);
                                                                    overlay;
                                                                    updatemember(
                                                                            "${snapshot.data[index].id}",
                                                                            qr.text,
                                                                            name.text,
                                                                            relation.text)
                                                                        .then((value) {
                                                                      setState(
                                                                          () {
                                                                        _futuremember =
                                                                            getmembers();
                                                                        overlay;
                                                                      });

                                                                      qr.clear();
                                                                      name.clear();
                                                                      relation
                                                                          .clear();
                                                                      setState(
                                                                          () {
                                                                        loading =
                                                                            false;
                                                                      });
                                                                      Navigator.pop(
                                                                          context);
                                                                    });
                                                                  },
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    padding: const EdgeInsets
                                                                            .all(
                                                                        16.0)),
                                                            icon: loading
                                                                ? Container(
                                                                    width: 24,
                                                                    height: 24,
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            2.0),
                                                                    child:
                                                                        const CircularProgressIndicator(
                                                                      color: Colors
                                                                          .white,
                                                                      strokeWidth:
                                                                          3,
                                                                    ),
                                                                  )
                                                                : const Icon(Icons
                                                                    .feedback),
                                                            label: const Text(
                                                                'SUBMIT'),
                                                          ),
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
                                                    "${snapshot.data[index].id}")
                                                .then((value) {
                                              setState(() {
                                                _futuremember = getmembers();
                                              });
                                            });
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QrScanner()));
        },
        child: const Icon(Icons.add),
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

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: const Center(child: CircularProgressIndicator()));
  }
}
