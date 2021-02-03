import 'package:consule_medical_store/Auth/LogIn.dart';
import 'package:consule_medical_store/Services/Auth_Service.dart';
import 'package:flutter/material.dart';
class Change_Password extends StatefulWidget {
final token;
  Change_Password({this.token});
  @override
  _Change_PasswordState createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String password;
  bool _obscureText = true;
// Toggles the password
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  changePassword() async {
    var _form = _formKey.currentState;
    if(_form.validate())
    {
      print('in on process');
      _form.save();
      Map<String,dynamic> body = {
        "password" : password,
      };

      await Auth_services.changePass(body, widget.token).then((onValue){
        try{
          print("in try condition");
          if (onValue['response_code']==200){
            print("${onValue['response_data']}");
            print("in if condition");
            showDialog(context: context,child: gotoButton(),);
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
              buildChangePasswordForm(),
            ],
          ),
        ));
  }
  Widget buildChangePasswordForm() {
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
                buildPasswordField(),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                buildConfirmPasswordField(),
                SizedBox(
                  height: height / 30,
                ),
                SizedBox(
                  height: height / 30,
                ),
                buildConfirmButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildPasswordField()  {
    return Container(
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 6) {
            return "Please Enter Min 6 Digit Password";
          } else
            return null;
        },
        onSaved: (value) {
          password = value;
        },
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
          ),
          hintText: "*******",
          contentPadding:
          new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          labelText: "Password",
        ),
        obscureText: _obscureText,
      ),
    );
  }
  Widget buildConfirmPasswordField() {
    return Container(
      child: TextFormField(
        controller: confirmPasswordController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Password";
          } else if (value.length < 6) {
            return "Please Enter Min 6 Digit Password";
          } else
            return null;
        },
        onSaved: (value) {
          password = value;
        },
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
  Widget  buildConfirmButton(){
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
          onPressed: changePassword,
          child:
          Text("Save Password ", style: TextStyle(color: Colors.white))),
    );
  }
  Widget gotoButton(){
    return
      new AlertDialog(
        title: Text("Password Reset"),
        actions: [
          FlatButton(
              color: Colors.red,
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>Login_Screen()));},
              child:
              Text("login", style: TextStyle(color: Colors.white))),
        ],
      );
  }
}
