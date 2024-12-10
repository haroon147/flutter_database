import 'package:flutter/material.dart';
class Crud2home extends StatefulWidget {
  const Crud2home({super.key});

  @override
  State<Crud2home> createState() => _Crud2homeState();
}

class _Crud2homeState extends State<Crud2home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD2Firebase "),),
    );
  }
}
