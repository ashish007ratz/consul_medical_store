import"package:flutter/material.dart";
class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
        ListView(
          children: [
            Container(
              height: height/2,
              child:
              CartOut(),
            ),
            // Place_Order(),
            Make_payment(),
          ],
        ),

    );
  }
  Widget CartOut(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
                width: width/1.2,
                child: Text("Disposable Hand Wash Gel",style: TextStyle(fontSize: 20),)),
          ),
          Container(
            width: width/1.2,
            height: height/5,
            child:Image.asset("lib/assets/images/logo.png"),
          ),
          Center(child: Text("price",style: TextStyle(fontSize: 20),)),
          Row(
            children: [
              SizedBox(
                height: height / 10,
              ),
              SizedBox(
                width: width / 20,
              ),
              Text("Address")
            ],
          ),
        ],
    );
  }
  // Widget Place_Order(){
  //   return Padding(
  //     padding: const EdgeInsets.all(18.0),
  //     child: FlatButton(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(18.0),
  //             side: BorderSide(color: Colors.black12)
  //         ),
  //         height: 50,
  //         minWidth: 100,
  //         color: Colors.red,
  //         child:
  //         Text("Place order ", style: TextStyle(color: Colors.white)),
  //         onPressed: () {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(builder: (context) => CheckOut()));
  //         }),
  //   );
  // }
  Widget Make_payment(){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black12)
          ),
          height: 50,
          minWidth: 10,
          color: Colors.red,
          child:
          Text("Make payment ", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckOut()));
          }),
    );
  }
}
