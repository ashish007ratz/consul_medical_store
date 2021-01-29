import 'package:consule_medical_store/Products/Check_Out.dart';
import 'package:flutter/material.dart';
class Shopping_Cart extends StatefulWidget {
  @override
  _Shopping_CartState createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  int _volume = 1;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.red,
        title: Center(child: Text("Check Out")),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: height/7,
              child:
              Cart1(),
            ),
            Check_Out(),
          ],
        ),
      ),
    );
  }
  Widget Cart1(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(

      child: Row(
        children: [
          Container(
            height: height/7,
            child:Image.asset("lib/assets/images/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                Text("Disposable Hand Wash Gel"),
                Row(
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    IconButton(
                      icon: Icon(Icons.add,color: Colors.greenAccent),
                        tooltip: '-',color: Colors.black,
                      onPressed: () {
                        setState(() {
                          _volume -= 1;
                        });
                      },
                    ),
                    Text('  $_volume'),
                    IconButton(
                      icon: Icon(Icons.add,color: Colors.greenAccent,),
                      onPressed: () {
                        setState(() {
                          _volume += 1;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
         Column(
           children: [
             IconButton(
               icon: Icon(Icons.cancel_outlined,color: Colors.black,),
               onPressed: () {
                 setState(() {
                 });
               },
             ),
             Text('150 INR')
           ],
         )
        ],
      ),
    );
  }

  Widget Check_Out(){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black12)
          ),
          height: 50,
          minWidth: 100,
          color: Colors.red,
          child:
          Text("CheckOut ", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOut()));
          }),
    );
  }
}
