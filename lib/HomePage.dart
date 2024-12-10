import 'package:flutter/material.dart';
import 'package:flutter_database/DbHelper/DbHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper? dbRef;
  List<Map<String, dynamic>> allNotes = [];
  @override
  void initState() {
    super.initState();
    dbRef = DbHelper.getInstance();
    getInitialNotes();
  }

  getInitialNotes() async {
    allNotes = await dbRef!.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Databases"),
      ),
      body: allNotes.isNotEmpty
          ? ListView.builder(
              itemCount: allNotes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: Text(allNotes[index][DbHelper.Column_NOTE_SERIALNO].toString()),
                  title: Text(allNotes[index][DbHelper.Column_NOTE_TITLE]),
                  subtitle: Text(allNotes[index][DbHelper.Column_NOTE_DESC]),
                );
              })
          : Center(
              child: Text("NO NOTES YET"),
            ),
      //all notes are viewed
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
           await dbRef!.addNote(mTile: "Honey", mDesc: "Zindabad");
          //all notes are being added
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
