import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
      
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(3),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                            primary: Color(0xff44D258),
                            ),
                            child: Text("Green",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.black))),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(3),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                            ),
                            child: Text(
                              "Red",
                              style: TextStyle(fontSize: 10),
                            )),
                      )),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.all(3),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            child: Text("Toast",
                                style: TextStyle(fontSize: 10))),
                      )),
                    ]),
              )]
          )
        )
    );
  }
}