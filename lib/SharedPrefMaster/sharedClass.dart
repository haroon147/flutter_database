import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class Myprefences{
  static SharedPreferences? _preferences;
  static init ()async{
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future setNumber(int n) {
  return   _preferences!.setInt("int_key", n);
  }
  static int getNumber(){
    return _preferences?.getInt("int_key")?? 0;
  }

  static Future setBool (bool value){
    return _preferences!.setBool("set_bool", value);
  }
  static bool getBool(){
    return _preferences?.getBool("set_bool")?? false;
  }
  static Future SaveList (List<String> list)=> _preferences!.setStringList("set_list", list);

  static List<String> getList()=> _preferences!.getStringList("set_list")?? [];

}