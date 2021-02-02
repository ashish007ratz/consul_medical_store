import 'package:consule_medical_store/Auth/ForgrtPasssword.dart';
import 'package:consule_medical_store/Auth/SignUp.dart';
import 'package:consule_medical_store/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:consule_medical_store/Services/Auth_Service.dart';

class Login_Screen extends StatefulWidget {
  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  bool isLoading = false,
      registerationLoading = false,
      rememberMe = false,
      value = false,
      passwordVisible = true;
  String email, password, name;

  bool _obscureText = true;


  onLogin() async {
    var _fprm = _formKey.currentState;
    if(_fprm.validate())
    {
      print('in on process');
      _fprm.save();
      Map<String,dynamic> body = {
        "email" : email,
        "password": password,
      };

      await Auth_services.signIn(body).then((onValue){
        try{
          if (onValue['response_code']==200){
            print('in if condition');
            print("${onValue['response_data']}");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
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
          Container(
            height: height/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image:AssetImage("lib/assets/images/logo.png"),
                  height: 150,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
              SizedBox(
                   height: height / 30,),
                SizedBox(height: 10,),
              buildLoginPageForm(),
        ],
      ),
    ));
  }
  Widget buildLoginPageForm() {
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
                 buildPasswordTextField(),
                ForgetPassword(),
                SizedBox(
                  height: height / 30,
                ),
                buildLoginButton(),

                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 15, 0, 0),
                  child:
                  TextButton(
                    child:
                    Row(
                      children: [
                        Text('New User ? ',style: TextStyle(color: Colors.black45, fontWeight:FontWeight.w200),),
                        Text(' Sign Up',style: TextStyle(color: Colors.red, fontWeight:FontWeight.w200),),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>SignUp()));
                    },),
                )
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
    labelText: "Email Address",
    ),
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      email = value;
    if (value.isEmpty) {
    return "Enter your email";
    } else if (!RegExp(
    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(value)) {
    return "Please enter valid email";
    } else
    return null;
    }

  )]);
}
  Widget buildPasswordTextField() {
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
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
        obscureText: _obscureText,
      ),
    );
  }
  Widget ForgetPassword()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
        children:[
    TextButton(
      child:
          Text('Forget Password ?',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>Forget_Password()));
      },)],);
  }
   Widget buildLoginButton(){
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
          onPressed: onLogin,
          child:
          Text("Sign In ", style: TextStyle(color: Colors.white))),
    );
   }
}
