import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/all_services_mainpage.dart';
import 'package:flutter_database/FirebaseAllServices/all_services_singup_page.dart';

import 'ForgetPassword.dart';
import 'UiHelper.dart';

class AllServicesLoginPage extends StatefulWidget {
  const AllServicesLoginPage({super.key});

  @override
  State<AllServicesLoginPage> createState() => _AllServicesLoginPageState();
}

class _AllServicesLoginPageState extends State<AllServicesLoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  login(String email, String password) async{
  if(email==null && password == null){
  UiHelper.CustomAlertBox(context, "Enter Required Fields");
  }
  else{
  UserCredential? userCredential;
  try{
  userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllServicesMainpage()));
  });
  }
  on FirebaseException catch(ex){
  return UiHelper.CustomAlertBox(context, ex.code.toString());
  }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("LoginPage",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900
              ),),
              TextField(
                keyboardType:TextInputType.emailAddress ,
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(color: Colors.pink, width: 5, style: BorderStyle.solid),
                    )
                ),
              ),
              TextField(
                keyboardType:TextInputType.text,
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:  BorderSide(color: Colors.pink, width: 5, style: BorderStyle.solid),
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                login(_emailController.text.toString(), _passwordController.text.toString());
              }, child: Text("HomePAge"),),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AllServicesSignUpPage()));
              }, child: Text("SignUp"),),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgetPassword()));
              }, child: Text("ForgetPassword"),),
          
          
            ],
          ),
        ),
      ),
    );
  }
}
