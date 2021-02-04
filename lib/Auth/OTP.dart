import 'package:consule_medical_store/Auth/Change_Password.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  final token;
  OTP({this.token});
  @override
  _OTPState createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController OTPControler = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String otp;


  otpfill() async {
    var _form = _formKey.currentState;
    if(_form.validate())
    {
      print('in on process');
      _form.save();
      Map<String,dynamic> body = {
        "otp" : otp,
      };

      await Auth_services.otpp(body, widget.token).then((onValue){
        print("token ==== ${widget.token}");
        print(otp);
        try{
          print("in try condition");
          print("${onValue}");
          if (onValue['response_code'] == 200){
            print("${onValue['response_data']}");
            print("in if condition");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Change_Password(token: onValue['response_data']['token'])));
          }
          else if (onValue['statusCode'] == 401)
          {
            print("in else if condition");
            print("${onValue['response_data']}");
          }
          else {
            print("in else condition");
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
                buildOTPTextField(),
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
  Widget buildOTPTextField() {
    return Column(
        children:[ TextFormField(
          onSaved: (value){
            otp = value;
          },
            decoration: InputDecoration(
              labelText: "Enter Your OTP",
            ),
            controller: OTPControler,
            validator: (value) {
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
          color: Colors.red,
          onPressed: otpfill,
          child:
          Text("Confirm OTP ", style: TextStyle(color: Colors.white))),
    );
  }
}