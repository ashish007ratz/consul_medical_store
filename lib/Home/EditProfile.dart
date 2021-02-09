import 'package:consule_medical_store/Home/Profile.dart';
import 'package:flutter/material.dart';
class Edit_profile extends StatefulWidget {
  @override
  _Edit_profileState createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  String firstName,lastName,email,phoneNo,address;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
          SingleChildScrollView(child:
      Container(
        child: Form(
            key: _formKey,
            child:
            Column(
              children: [
                Row(
                  children: [
                    TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "First Name";
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "First Name",
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        labelText: " first Name",
                      ),
                    ),
                    TextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "last Name";
                        } else
                          return null;
                      },
                      onSaved: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "last Name",
                        contentPadding:
                        new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        labelText: " last Name",
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: firstNameController,
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Address";
                    } else
                      return null;
                  },
                  onSaved: (value) {
                    firstName = value;
                  },
                  decoration: InputDecoration(
                    hintText: "Address",
                    contentPadding:
                    new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    labelText: "Address",
                  ),
                ),
                SubmitButton(),
              ],
            )
        ),
      ),
          ),
    );
  }
  Widget SubmitButton(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  new SizedBox(
      width: width/2,
      height: height/20,
      child: new RaisedButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new Text('Submit',style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile_Data()));
        },
      ),
    );
  }
}
