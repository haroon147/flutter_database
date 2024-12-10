import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/all_serivices_login_page.dart';
import 'package:flutter_database/FirebaseAllServices/all_services_mainpage.dart';



class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {

  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
  checkUser() {
    final user= FirebaseAuth.instance.currentUser;
    if(user != null){
      return AllServicesMainpage();
    }
    else{
      return AllServicesLoginPage();
    }

  }
}
