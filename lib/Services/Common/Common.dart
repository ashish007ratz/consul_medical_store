import 'package:shared_preferences/shared_preferences.dart';
//save token on storage
class Common {
  static Future<bool>setToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('token', token);
  }

  //retrieve token from  storage
static Future<String>getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(()=> prefs.getString('token'));
}

  static void setUserInfo(decode) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Future(()=>prefs.get('token'));
  }
}