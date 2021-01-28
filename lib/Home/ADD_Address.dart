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
      body: Column(
        children: [
          Enter_Your_Address(),
          Container(
            height: height/7,
            child:Address(),
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
              Text("Enter your Address Here",style: TextStyle(fontSize: 30),)
            ],
          )
        ],
      ),
    );
  }
  Widget Address(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Lane no"),
              SizedBox(
                width: width/10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: " ",
                  contentPadding:
                  new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  labelText: "Home Add",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("Land Mark"),
              SizedBox(
                width: width/10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: " ",
                  contentPadding:
                  new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  labelText: "Land mark",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("City"),
              SizedBox(
                width: width/10,
              ),
              SelectState(
                onCityChanged:(value) {
                  setState(() {
                    cityValue = value;
                  });
                },
              ),
              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     hintText: " ",
              //     contentPadding:
              //     new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //   ),
              // ),
            ],
          ),
          Row(
            children: [
              Text("Select country"),
              SizedBox(
                width: width/10,
              ),
              SelectState(
                onCountryChanged: (value) {
                  setState(() {
                    countryValue = value;
                  });
                },
              ),
            ],
          ),
          Row(
            children: [
              Text("State"),
              SizedBox(
                width: width/10,
              ),
              SelectState(
                onStateChanged:(value) {
                  setState(() {
                    stateValue = value;
                  });
                },
              ),
              // TextFormField(
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20)),
              //     hintText: " ",
              //     contentPadding:
              //     new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //   ),
              // ),
            ],
          ),
          Row(
            children: [
              Text("PIN Code"),
              SizedBox(
                width: width/10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: " ",
                  contentPadding:
                  new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget ADD_Address(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: new SizedBox(
        width: width/2,
        height: height/20,
        child: new RaisedButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
    ),
             child: new Text('Add Address',style: TextStyle(color: Colors.white)),
               onPressed: () {
               Navigator.push(
         context,
            MaterialPageRoute(builder: (context) => User_address()));
    },
    ),
    ));
  }
}
