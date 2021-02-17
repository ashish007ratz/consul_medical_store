import 'package:consule_medical_store/Home/ADD_Address.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
class User_address extends StatefulWidget {
  @override
  _User_addressState createState() => _User_addressState();
}

class _User_addressState extends State<User_address> {
  List address;
  bool addressloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  getadressdata() async {
    await Auth_services.getaddress().then((value){
      if(value['response_code'] == 200){
        if(mounted){
          setState(() {
            addressloading = false;
          });
        }

        address = value['response_data']['banners'];
      }
      else{
        addressloading = true;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar( backgroundColor: Colors.red,
        title: Center(child: Text("My Address")),
    ),
      body: ListView(
        children: [
          Container(
            height: height/7,
            child:Address1(),
          ),
          ADD_Address(),
        ],
      ),
    );
  }
  Widget Address1(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Lane no"),
              SizedBox(
                width: width/10,
              ),
              Text("     4 harimandir haridwar")
            ],
          ),
          Row(
            children: [
             Text("Land Mark"),
              SizedBox(
                width: width/10,
              ),
              Text("Primary School"),
            ],
          ),
          Row(
            children: [
              Text("City"),
              SizedBox(
                width: width/10,
              ),
              Text("            Dehradun"),
            ],
          ),
          Row(
            children: [
              Text("State         "),
              SizedBox(
                width: width/10,
              ),
              Text("Uttarakhand"),
            ],
          ),
          Row(
            children: [
              Text("PIN Code  "),
              SizedBox(
                width: width/10,
              ),
              Text("248001"),
            ],
          ),
        ],
      ),
    );
  }
  Widget ADD_Address(){
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
          Text("Add New Address ", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_Address()));
          }),
    );
  }
}