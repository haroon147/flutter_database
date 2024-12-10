// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefClass extends StatefulWidget {
//   const SharedPrefClass({super.key});
//
//   @override
//   State<SharedPrefClass> createState() => _SharedPrefClassState();
// }
//
// class _SharedPrefClassState extends State<SharedPrefClass> {
//   TextEditingController _textField = TextEditingController();
//   var name = "";
//   String  getVal = "";
//   var newVal = "No DataSaved";
//   @override
//   void initState() {
//     super.initState();
//     getValue;
//   }
//
//   // void getValue() async{
//   //   final pref = await SharedPreferences.getInstance();
//   //   getVal != pref.getString("Name");
//   //  // var newVal = getVal !=null ? getVal : "NO DataSaved";
//   //   newVal = getVal ?? "No DataSaved yet";
//   // }
//   void getValue() async{
//     var prefs =await SharedPreferences.getInstance();
//     var getValue = prefs.getString("Name");
//     // newVal = getValue !=null ? getValue : "No value";
//     newVal = getValue ?? "no value";
//     setState(() {
//
//     };
//     }
//
//     @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text( newVal,
//                 style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
//               ),
//               TextField(
//                 style: TextStyle(fontSize: 34),
//                   controller: _textField,
//                   decoration: InputDecoration(
//                     labelText: 'Hello World',
//                   prefixIcon: Icon(Icons.ad_units),
//                   )
//                 ),
//               ElevatedButton(onPressed: () async{
//                 final pref = await SharedPreferences.getInstance();
//                 name = _textField.text.toString();
//                 pref.setString("Name", name);
//                 setState(() {
//
//                 });
//               }, child: Text("Button"),),
//             ],
//           ),
//         ),
//       ),
//     );
