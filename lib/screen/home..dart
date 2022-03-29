import 'package:flutter/material.dart';
import 'package:web_services/main.dart';
import 'package:web_services/screen/lostmobile.dart';
import 'package:web_services/screen/qrcode/home_qr.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text('Home Screen'),
        ),
        body: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(children: [
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
                            child:
                                Text("Toast", style: TextStyle(fontSize: 10))),
                      )),
                    ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
                
              ),
                Container(
                  padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.30),
                child: Text("System Status",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05,fontWeight: FontWeight.bold),
                
                ), 
                
                ) ,
              Container(
                height:  MediaQuery.of(context).size.height*0.30,
                width: MediaQuery.of(context).size.width*0.30,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 221, 225, 230),
                  image: const DecorationImage(
                    image: NetworkImage(
                        ''),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black,
                    width: 8,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
              ),
              Container(
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: 
                    Container(
                           margin: EdgeInsets.all(3),
                      child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                      }, 
                      child:Text('Setting'), 
                      ),
                    )
                    ),
                     Expanded(child: 
                    Container(
                           margin: EdgeInsets.all(3),
                      child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>QRHomeScreen()));
                      }, 
                      child:Text('Add  Member'), 
                      ),
                    )
                    ),
                     Expanded(child: 
                    Container(
                           margin: EdgeInsets.all(3),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                      }, 
                      child:Text('Logout'), 
                      ),
                    )
                    ),
                    
                  ],
                ),
              )

            ])
            )
            );
  }
}
