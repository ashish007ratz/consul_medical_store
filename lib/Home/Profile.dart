import 'package:consule_medical_store/Home/EditProfile.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
class Profile_Data extends StatefulWidget {
  @override
  _Profile_DataState createState() => _Profile_DataState();
}

class _Profile_DataState extends State<Profile_Data> {
  void initState(){
    super.initState();
    profileData();
  }
  var userInfo;
  bool isdataLoading = true;

  profileData() async{
    await Auth_services.getUserInfo().then((onValue){
      try {
        if(onValue['response_code'] == 200)
          {
            isdataLoading == false;
            userInfo = onValue['response_data']['userInfo'];
            print("${userInfo['firstName']}");
          }
        else if(onValue['response_code'] == 401){
          print("${onValue['response_code']}");
        }
        else{

        }
        }
        catch(error){

        }
      });
    }
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
      ],),
    ),),
    );
  }
  Widget ProfileDataFill(){
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit_outlined),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder : (context)=>Edit_profile()));
                      }),
                ],
              ),
              Row(
                children: [
                  Text("Full Name  :",style: TextStyle(color: Colors.black),),
                  SizedBox(
                    width: width/10,
                  ),
                  Text(isdataLoading == true ? " " : "${userInfo['firstName']}"),
                  // Text("${userInfo['lastName']}"),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  Text("Email  :",style: TextStyle(color: Colors.black),),
                  SizedBox(
                    width: width/10,
                  ),
                  Text(isdataLoading == true ? " " : "${userInfo['email']}"),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Row(
                children: [
                  Text("Phone  :",style: TextStyle(color: Colors.black),),
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
                  Text("Address :",style: TextStyle(color: Colors.black),),
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
                  Text("PIN Code  :",style: TextStyle(color: Colors.black),),
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
      ),
    );
  }
}
