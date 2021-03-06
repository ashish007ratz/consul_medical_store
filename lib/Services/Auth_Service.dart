import 'dart:convert';
import 'package:consule_medical_store/Services/Contants.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'Common/Common.dart';

class Auth_services {
static final Client client = Client();

static Future<Map<String, dynamic>> signUp(body) async {
  final response = await client.post(Constants.baseurl + "users/register",
    body : json.encode(body), headers: {'Content-Type' : 'application/json'});
  return json.decode(response.body);
}
static Future<Map<String, dynamic>> signIn(body) async {
  final response = await client.post(Constants.baseurl + "users/login",
      body : json.encode(body), headers: {'Content-Type' : 'application/json'});
  return json.decode(response.body);
}
static Future<Map<String, dynamic>> forgetPass(body) async {
  final response = await client.post(Constants.baseurl + "users/verify/email",
      body : json.encode(body), headers: {'Content-Type' : 'application/json'});
  return json.decode(response.body);
}
static Future<Map<String, dynamic>> otpp(body, token) async {
  final response = await client.post(Constants.baseurl + "users/verify/OTP",
      body : json.encode(body), headers: {'Content-Type' : 'application/json', 'Authorization' : 'bearer $token'});
  return json.decode(response.body);
}

static Future<Map<String, dynamic>> changePass(body, token) async {
  final response = await client.post(Constants.baseurl + "users/reset-password",
      body : json.encode(body), headers: {'Content-Type' : 'application/json', 'Authorization': 'bearer $token'});
  return json.decode(response.body);
}

// get user info
static Future<Map<String,dynamic>> getUserInfo() async {
  String token;
  await Common.getToken().then((onValue) {
    token = onValue;
  });
  SharedPreferences prefs =await SharedPreferences.getInstance();
  final response = await client.get(Constants.baseurl +"users/me",
      headers:{'content-Type':'application/json', 'Authorization':'bearer $token'
  });
  print(response.body);
  Common.setUserInfo(json.decode(response.body));
  return json.decode(response.body);
}

  static Future<Map<String,dynamic>> getBanner() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"banner",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    Common.getBanner(json.decode(response.body));
    return json.decode(response.body);
  }


  static Future<Map<String,dynamic>> getProduct() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"products",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    return json.decode(response.body);
  }


  static Future<Map<String,dynamic>> getProductdeal() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"products/home/top/deal",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    return json.decode(response.body);
  }


  static Future<Map<String,dynamic>> addCart() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"cart/add/product",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    return json.decode(response.body);
  }

  static Future<Map<String,dynamic>> getaddress() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"address",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    return json.decode(response.body);
  }

  static Future<Map<String,dynamic>> getCategory() async {
    String token;
    await Common.getToken().then((onValue) {
      token = onValue;
    });
    SharedPreferences prefs =await SharedPreferences.getInstance();
    final response = await client.get(Constants.baseurl +"categories",
        headers:{'content-Type':'application/json', 'Authorization':'bearer $token'});
    print(response.body);
    return json.decode(response.body);
  }



  static Future<Map<String, dynamic>> addAddress(body , token) async {
    final response = await client.post(Constants.baseurl + "address",
        body : json.encode(body), headers: {'Content-Type' : 'application/json' ,'Authorization':'bearer $token'});
    return json.decode(response.body);
  }
}
