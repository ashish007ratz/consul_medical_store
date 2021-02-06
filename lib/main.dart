import 'package:consule_medical_store/Auth/LogIn.dart';
import 'package:consule_medical_store/Auth/Splash.dart';
import 'package:consule_medical_store/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(MaterialApp(home: email == null ? Splash_Screen() : Home()));
}

