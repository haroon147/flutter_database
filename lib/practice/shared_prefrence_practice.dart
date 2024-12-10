import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrencePractice extends StatefulWidget {
  const SharedPrefrencePractice({super.key});

  @override
  State<SharedPrefrencePractice> createState() => _SharedPrefrencePracticeState();
}

class _SharedPrefrencePracticeState extends State<SharedPrefrencePractice> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstController = TextEditingController();
  static const String VALKey = "ValKey";

  var name =" ";
  var newVal = "No Value Saved";
  @override
  void initState() {
    // TODO: implement initState
    getValue();
  }
  void getValue() async{
    var prefs =await SharedPreferences.getInstance();
    var getValue = prefs.getString(VALKey);
    // newVal = getValue !=null ? getValue : "No value";
    newVal = getValue ?? "no value";
    setState(() {

    });    // newVal = getValue! ? getValue : "No value yet";
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title:Text("Shared preferences Basics"),),
        body: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(newVal,style: TextStyle(fontSize: 45),),
                  TextFormField(
                    style: TextStyle(fontSize: 44),
                    controller: _firstController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() async{
                      name = _firstController.text.toString();
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString(VALKey, name);
                    },);
                  }, child: Text("Button"))
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
