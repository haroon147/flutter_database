import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database/CRUD/AddEmployees.dart';

class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Flexible(
                child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Employee').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                var documents = snapshot.data!.docs; // Access the list of DocumentSnapshots
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var data = documents[index].data()
                        as Map<String, dynamic>; // Explicitly cast to Map
                    return ListTile(
                      title: Text(data["Name"]),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Addemployees()));
      },child: Icon(Icons.add),),
    );
  }
}

// Material(
//   elevation: 5.0,
//   borderRadius: BorderRadius.circular(10),
//   child: Container(
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//         color: Colors.orange,
//         border: Border.all(
//             color: Colors.black,
//             width: 5,
//             style: BorderStyle.solid)),
//     child: Column(
//       children: [
//         Text(
//           "Muhammad Haroon:",
//           style: TextStyle(
//             color: Colors.blue,
//             fontWeight: FontWeight.w900,
//             fontSize: 24
//           ),
//         ),
//         Text(
//           "Age:",
//           style: TextStyle(
//               color: Colors.blue,
//               fontWeight: FontWeight.w900,
//               fontSize: 24
//           ),
//         ),
//         Text(
//           "Location : ",
//           style: TextStyle(
//               color: Colors.blue,
//               fontWeight: FontWeight.w900,
//               fontSize: 24
//           ),
//         ),
//
//       ],
//     ),
//   ),
// )
