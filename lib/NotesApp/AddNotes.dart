import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  //AFTER COMPLETING THE UI PART WE HAVE TO CREATE
  //STEP 1: CREATE CONTROLLERS

  TextEditingController _title = TextEditingController();
  TextEditingController _Description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("NotesApp",
        ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 3,)
              ),
              child: Column(
                children: [
                  TextField(
                    //Step2: pass those controller
                    controller: _title,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: "Title"
                    ),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize:34),
                  ),
                  TextField(
                    //Step2: pass those controller
                  controller: _Description,
                    maxLines: 7,
                    decoration: InputDecoration(
                        hintText: "Description"
                    ),
                  ),

                ],
              ),
            ),
            Container(
              height: 50,width: double.infinity,
              color: Colors.black54,
              margin: EdgeInsets.all(30),
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.black54, backgroundColor: Colors.blue),
                  child: Text("HELO")),
            )
          ],
        ),
      ),
    );
  }
}
