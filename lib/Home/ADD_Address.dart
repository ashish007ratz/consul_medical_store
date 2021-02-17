import 'package:consule_medical_store/Home/Address.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
class Add_Address extends StatefulWidget {
  final token;
  Add_Address({this.token});
  @override
  _Add_AddressState createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController addressController = TextEditingController();
  TextEditingController flatNoController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

  bool addressloading = true;
  String address,flatno ,postalcode;

  addAddresses() async {
    var _form = _formKey.currentState;
    if(_form.validate())
    {
      print('in on process');
      _form.save();
      Map<String,dynamic> body = {
        "address": address,
        "flatNo": flatno,
        "postalCode": postalcode,
      };

      await Auth_services.addAddress(body, widget.token).then((onValue){
        try{
          print("${onValue}");
          print("token ==== ${widget.token}");
          if (onValue['response_code']==201){
            print('in if condition');
            print("${onValue['response_data']}");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>User_address()));
          }
          else if (onValue['status_code']==401)
          {
            print("${onValue['response_data']}");
          }
          else {
            print("${onValue['response_data']}");
          }
        }catch(error){
          print(error);
        }
      });
    }

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
      child: Form(
        key: _formKey,
      child:
      Container(
        child: Column(
          children: [
            SizedBox(
              width: width/20,
            ),
            TextFormField(
              controller: addressController,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter address";
                }  else
                  return null;
              },
              onSaved: (value) {
                address = value;
              },
              decoration: InputDecoration(
                hintText: "address",
                contentPadding:
                new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                labelText: "address",
              ),
            ),
            TextFormField(
              controller: flatNoController,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter Flat no";
                }  else
                  return null;
              },
              onSaved: (value) {
                flatno = value;
              },
              decoration: InputDecoration(
                hintText: "flat",
                contentPadding:
                new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                labelText: "Flat no",
              ),
            ),
            TextFormField(
              controller: postalCodeController,
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value.isEmpty) {
                  return "Enter postal Code";
                }  else
                  return null;
              },
              onSaved: (value) {
                postalcode = value;
              },
              decoration: InputDecoration(
                hintText: "Postal code",
                contentPadding:
                new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                labelText: "Postal code",
              ),
            ),
          ],
        ),
      ),
    ));
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
          onPressed: addAddresses),
    );
  }
}
