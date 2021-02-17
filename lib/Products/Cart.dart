import 'package:consule_medical_store/Products/Check_Out.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';


class Shopping_Cart extends StatefulWidget {
  @override
  _Shopping_CartState createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  bool isproductloading = true;
  List productdata;
  int _volume = 1;
  addCart() async {
    await Auth_services.getProduct().then((onValue){
      if(onValue['response_code'] == 200){
        if(mounted){
          setState(() {
            isproductloading = false;
          });
        }
        productdata = onValue['response_data'];
        print("product list is  === ${productdata}");
      }
      else{
        isproductloading = true;
        print(onValue['response_data']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.red,
        title: Center(child: Text("Check Out")),
      ),
      body: Container(
        child: isproductloading == true? GFLoader(type: GFLoaderType.ios,) : ListView(
          children: [
        Container(
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
