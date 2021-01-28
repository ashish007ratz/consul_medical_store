import 'package:consule_medical_store/Auth/LogIn.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  bool isLoading = false,
      registerationLoading = false,
      rememberMe = false,
      value = false,
      passwordVisible = true;
  String email, password, name;

  bool _obscureText = true;

  void Validate()
  {
    if(_formKey.currentState.validate())
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>Login_Screen()));
    else{
      print("data must be filled");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:SingleChildScrollView(
        child:Stack(
           children: [
          Image(
              image:AssetImage("lib/assets/images/background.png"),
              height: height,
                width: width,
              fit: BoxFit.cover,
                 ),
              Container(
                height: height/2.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                    image:AssetImage("lib/assets/images/logo.png"),
                     height: 100,
                         width: 100,
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
    return Padding(
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
                  height: height / 30,),
                SizedBox(
                  height: height / 30,),

                buildNameTextField(),
                SizedBox(
                  height: height / 30,
                ),
                buildEmailTextField(),
                SizedBox(
                  height: height / 30,
                ),
                buildPasswordTextField(),
                SizedBox(
                  height: height / 30,
                ),
                buildSignInButton(),

                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 0, 0),
                  child:
                  TextButton(
                    child:
                    Row(
                      children: [
                        Text('Already have account ? ',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
                        Text(' Sign In',style: TextStyle(color: Colors.pink, fontWeight:FontWeight.w200),),
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>Login_Screen()));
                    },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  buildNameTextField(){
    return Container(
      child: TextFormField(
        controller: NameController,
        keyboardType: TextInputType.text,
        validator: (String value) {
          if (value.isEmpty) {
            return "Enter Full Name";
          } else
            return null;
        },
        onSaved: (String value) {
          name = value;
        },
        decoration: InputDecoration(
          hintText: "Full Name",
          contentPadding:
          new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          labelText: "Name",
        ),
        obscureText: _obscureText,
      ),
    );
  }
  Widget buildEmailTextField() {
    return Column(
        children:[ TextFormField(
            decoration: InputDecoration(
              hintText: "ash@gmail.com",
              labelText: "Email Address",
            ),
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
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
        onSaved: (String value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: "*******",
          contentPadding:
          new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          labelText: "Password",
        ),
        obscureText: _obscureText,
      ),
    );
  }
  Widget buildSignInButton(){
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black12)
          ),
          height: 50,
          minWidth: 300,
          color: Colors.pink,
          onPressed: Validate,
          child:
          Text("Sign Up ", style: TextStyle(color: Colors.white))),
    );
  }
}
