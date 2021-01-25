import 'package:consule_medical_store/Home/Carousel.dart';
import 'package:flutter/material.dart';
class Shopping_Cart extends StatefulWidget {
  @override
  _Shopping_CartState createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.red,
        title: Center(child: Text("My Cart")),
      ),
      body: SingleChildScrollView(
        child: ListView(
          children: [
            Cart1(),
          ],
        ),
      ),
    );
  }
  Widget Cart1(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height/10,
      width: width,
      child: Row(
        children: [
          Container(
            child:Image.asset("lib/assets/images/Logo.png"),
          ),
          Column(
            children: [
              Text("Disposable Hand Wash Gel"),
              Row(
                children: [
                  FlatButton(onPressed: (){}),
                  Text("1"),
                  FlatButton(onPressed: (){}),
                ],
              ),
            ],
          ),
         Column(
           children: [
             FlatButton(onPressed: (){}),
             Text("150 INR")
           ],
         )
        ],
      ),
    );
  }
}
