import 'package:consule_medical_store/Auth/OTP.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
class Forget_Password extends StatefulWidget {
  @override
  _Forget_PasswordState createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoading = false;
  String email;


  Forget() async {
    var _form = _formKey.currentState;
    if(_form.validate())
    {
      print('in on process');
      _form.save();
      Map<String,dynamic> body = {
        "email" : email,
      };

      await Auth_services.forgetPass(body).then((onValue){
        try{
          print("in try condition");
          print("${onValue}");
          if (onValue['response_code']==200){
            print("${onValue['response_data']}");
            print("in if condition");
            showDialog(context: context,child: new AlertDialog(
              title: Text("${onValue['response_data']['message']}"),
              actions: [
                FlatButton(
                    color: Colors.red,
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>OTP(token: onValue['response_data']['token'],)));},
                    child:
                    Text("ok", style: TextStyle(color: Colors.white))),
              ],
            ));
          }
          else if (onValue['status_code']==401)
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
                buildEmailTextField(),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                buildForgetButton(),

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
          onSaved: (value){
            email = value;
          },
            decoration: InputDecoration(
              labelText: "Email Address",
            ),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return "Please Enter your email";
              } else if (!RegExp(
                  r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                  .hasMatch(value)) {
                return "Please enter valid email";
              } else
                return null;
            }

        )]);
  }
  Widget buildForgetButton(){
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
          onPressed: (){Forget();},
          child:
          Text("Get OTP ", style: TextStyle(color: Colors.white))),
    );
  }
}
