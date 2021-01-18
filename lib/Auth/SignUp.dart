import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:flutter/material.dart';

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


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
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
          buildLoginPageForm(),
        ],
      ),
    );
  }
  Widget buildLoginPageForm() {
    double height = MediaQuery.of(context).size.height;
    return Form(
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
              Container(
                child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 200, 0, 0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height / 25,
              ),
              buildEmailTextField(),
              // SizedBox(
              //   height: height / 30,
              // ),
              SizedBox(
                height: height / 30,
              ),
              buildPasswordTextField(),
              SizedBox(
                height: height / 30,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(100, 15, 0, 0),
                child:
                TextButton(
                  child:
                  Row(
                    children: [
                      Text('Already a member',style: TextStyle(color: Colors.black, fontWeight:FontWeight.w200),),
                      Text(' Sign In',style: TextStyle(color: Colors.blue, fontWeight:FontWeight.w200),),
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
    );
  }
  Widget buildEmailTextField() {
    return Container(
        child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(.0),
                child: Icon(
                  Icons.email,
                  color: Colors.black,
                ), // icon is 48px widget.
              ),
              hintText: "ash@gmail.com",
              contentPadding:
              new EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              labelText: "Email",
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

        ));
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
          prefixIcon: Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.lock,
              color: Colors.black,
            ), // icon is 48px widget.
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
}
