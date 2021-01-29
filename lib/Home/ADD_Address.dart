import 'package:consule_medical_store/Home/Address.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
class Add_Address extends StatefulWidget {
  @override
  _Add_AddressState createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  String countryValue;
  String stateValue;
  String cityValue;
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              width: width/20,
            ),
            SelectState(
              onStateChanged:(value) {
                setState(() {
                  stateValue = value;
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "PIN Code",
              ),
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter PIN Code";
                } else
                  return null;
              },
              onSaved: (String value) {
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Land Mark",
              ),
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Land Mark";
                } else
                  return null;
              },
              onSaved: (String value) {
              },
            ),
          ],
        ),
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
          Text("Add Address ", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Add_Address()));
          }),
    );
  }
}
