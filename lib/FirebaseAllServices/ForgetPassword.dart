import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/all_serivices_login_page.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {

  forgetPassword(email)async{

     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }


  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
            ),
            ElevatedButton(onPressed: forgetPassword(_emailController.text.toString()), child: Text("SendLink"))
          ],
        ),
      ),
    );
  }
}
