import 'package:shared_preferences/shared_preferences.dart';

class MyPreference{
  static SharedPreferences? _preference;
  static const IntKey = "Int_key";
  static const BoolKey = "bool_key";
  static const ListKey = "List_Key";

  static init() async {
    _preference = await SharedPreferences.getInstance();
    return _preference;
  }

  static Future saveNumber(int n) {
   return _preference!.setInt("Int_key", n);
  }
  static int getNumber()  {
   return  _preference!.getInt("Int_key") ?? 0;
  }
  
  static Future saveCheckBox(bool c){
    return _preference!.setBool("bool_key", c);
  }
  static bool fetchBool(){
    return _preference!.getBool("bool_key") ?? false;
  }
  static Future saveList(List<String> list) {
    return _preference!.setStringList("List_Key", list );
  }
  static List<String> FetchList(){
    return _preference!.getStringList("List_Key") ?? [];
  }
}