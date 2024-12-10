import 'package:flutter/material.dart';

import 'all_serivices_login_page.dart';
class FirebaseAllServices extends StatefulWidget {
  const FirebaseAllServices({super.key});

  @override
  State<FirebaseAllServices> createState() => _FirebaseAllServicesState();
}

class _FirebaseAllServicesState extends State<FirebaseAllServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>AllServicesLoginPage()));
            }, child: Text("LoginPage"))
          ],
        ),
      ),
    );
  }
}
