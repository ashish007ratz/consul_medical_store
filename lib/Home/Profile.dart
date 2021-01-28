import 'package:consule_medical_store/Auth/Change_Password.dart';
import 'package:flutter/material.dart';
class Profile_Data extends StatefulWidget {
  @override
  _Profile_DataState createState() => _Profile_DataState();
}

class _Profile_DataState extends State<Profile_Data> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(child:
    Scaffold(
      body: Container(
        child:Column(
          children:[
             ProfileDataFill (),
            ChangePaaswordButton (),
      ],),
    ),),
    );
  }
  Widget ProfileDataFill(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
        child: Column(
          children: [
            Center(
              child: Container(
                height: height/4,
                width: width/2,
                child: new Image.asset("lib/assets/images/logo.png",fit: BoxFit.fill),
                ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("Full Name                 =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("Ashish"),
                Text("Raturi"),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("Phone Number        =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("8126940910"),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("Address                    =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("Lane no 4 dehradun"),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("Phone No                 =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("248005575767"),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("PIN Code                  =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("248005"),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
          ],
        )
    );
  }
  Widget ChangePaaswordButton(){
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
        child: new Text('Change Password',style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Change_Password()));
        },
      ),
    );
  }
}
