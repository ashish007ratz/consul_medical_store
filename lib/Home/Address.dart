import 'package:consule_medical_store/Home/ADD_Address.dart';
import 'package:flutter/material.dart';
class User_address extends StatefulWidget {
  @override
  _User_addressState createState() => _User_addressState();
}

class _User_addressState extends State<User_address> {
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
          Enter_Your_Address(),
          Container(
            height: height/7,
            child:Address1(),
          ),
          ADD_Address(),
        ],
      ),
    );
  }
  Widget Enter_Your_Address(){
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Enter your Address Here",style: TextStyle(fontSize: 30,color: Colors.red),),
            ],
          )
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
    return Center(
      child: FlatButton(
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Add_Address()));
        },
        child:Row(
          children:[
            Text("Add New Address", style: TextStyle(color: Colors.white))],),),
    );
  }
}
