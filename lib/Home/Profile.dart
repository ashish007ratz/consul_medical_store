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
        child: ProfileDataFill (),
      ),
    ),
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
                height: height/5,
                width: width/2,
                child: new Image.asset("lib/assets/images/logo.png",fit: BoxFit.fill),
                ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                Text("Full Name =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("Ashish"),
                Text("Raturi"),
              ],
            ),
            Row(
              children: [
                Text("Address =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("Lane no 4 dehradddun"),
              ],
            ),
            Row(
              children: [
                Text("Phone No =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("248005575767"),
              ],
            ),
            Row(
              children: [
                Text("PIN Code =>",style: TextStyle(color: Colors.black),),
                SizedBox(
                  width: width/10,
                ),
                Text("248005"),
              ],
            ),
          ],
        )
    );
  }
}
