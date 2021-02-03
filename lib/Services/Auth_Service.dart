import 'dart:convert';
import 'package:consule_medical_store/Services/Contants.dart';
import 'package:http/http.dart' show Client;

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
      body : json.encode(body), headers: {'Content-Type' : 'application/json'});
  return json.decode(response.body);
}

static Future<Map<String, dynamic>> changePass(body, token) async {
  final response = await client.post(Constants.baseurl + "users/reset-password",
      body : json.encode(body), headers: {'Content-Type' : 'application/json'});
  return json.decode(response.body);
}
}