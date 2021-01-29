import 'package:consule_medical_store/Home/Home.dart';
import 'package:consule_medical_store/Auth/Change_Password.dart';
import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController OTPControler = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false,
      registerationLoading = false,
      rememberMe = false,
      value = false,
      passwordVisible = true;
  String OTP;

  bool _obscureText = true;

  void Validate()
  {
    if(_formKey.currentState.validate())
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>Change_Password()));
    else{
      print("data must be filled");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body:
        SingleChildScrollView(
          child:Stack(
            children: [
              Image(
                image:AssetImage("lib/assets/images/background.png"),
                height: height,
                width: width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(125.0),
                child: Image(
                  image:AssetImage("lib/assets/images/logo.png"),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: height / 30,),
              SizedBox(height: 10,),
              buildForgetPasswordForm(),
            ],
          ),
        ));
  }
  Widget buildForgetPasswordForm() {
    double height = MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.fromLTRB(30, 125, 30, 0),
      child: Form(
        key: _formKey,
        child: Theme(
          data: ThemeData(
            brightness: Brightness.light,
          ),
          child: Container(
            height: height/1.355,
            decoration: new BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                buildEmailTextField(),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                buildOTPButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildEmailTextField() {
    return Column(
        children:[ TextFormField(
            decoration: InputDecoration(
              labelText: "Enter Your OTP",
            ),
            controller: OTPControler,
            validator: (String value) {
              if (value.isEmpty) {
                return "OTP not Valid";
              }  else
                return null;
            }

        )]);
  }
  Widget buildOTPButton(){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black12)
          ),
          height: 50,
          minWidth: 400,
          color: Colors.pink,
          onPressed: Validate,
          child:
          Text("Conform OTP ", style: TextStyle(color: Colors.white))),
    );
  }
}
