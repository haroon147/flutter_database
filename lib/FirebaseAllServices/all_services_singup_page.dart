import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/FirebaseAllServices/UiHelper.dart';
import 'package:flutter_database/FirebaseAllServices/all_serivices_login_page.dart';

class AllServicesSignUpPage extends StatefulWidget {
  const AllServicesSignUpPage({super.key});

  @override
  State<AllServicesSignUpPage> createState() => _AllServicesSignUpPageState();
}

class _AllServicesSignUpPageState extends State<AllServicesSignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SignUp(String email, String password)async{
    if(email==null && password == null){
      UiHelper.CustomAlertBox(context, "Enter Required Fields");
    }
    else{
      UserCredential? userCredential;
      try{
        userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllServicesLoginPage()));
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SignUpPage",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900
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
            ElevatedButton(onPressed: (){
              SignUp(_emailController.text.toString(), _passwordController.text.toString());
            }, child: Text("SignUp"))

          ],
        ),
      ),
    );
  }
}
