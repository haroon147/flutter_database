import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/UiHelper.dart';

import 'all_serivices_login_page.dart';
class AllServicesMainpage extends StatefulWidget {
  const AllServicesMainpage({super.key});

  @override
  State<AllServicesMainpage> createState() => _AllServicesMainpageState();
}

class _AllServicesMainpageState extends State<AllServicesMainpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MainPage"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MainPage"),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((v){
                Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> AllServicesLoginPage()));
              });
            }, child: Text("LogOut"))
          ],
        ),
      ),
    );
  }
}
