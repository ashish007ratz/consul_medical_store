import 'package:consule_medical_store/Auth/LogIn.dart';
import 'package:consule_medical_store/main.dart';
import 'package:flutter/material.dart';
class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  bool Splash_Screen = false;

  void initState() {
    super.initState();
    if (Splash_Screen == false) {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login_Screen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:height,
            width: width,
            child:
            Image(
              image: AssetImage('lib/assets/images/background.png'),
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 125,top: 250),
            child: Container(
              height: 150,
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Image(
                    image: AssetImage('lib/assets/images/logo.png'),
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
