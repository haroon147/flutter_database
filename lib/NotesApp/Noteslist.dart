import 'package:flutter/material.dart';

import 'AddNotes.dart';

class Noteslist extends StatefulWidget {
  const Noteslist({super.key});

  @override
  State<Noteslist> createState() => _NoteslistState();
}

class _NoteslistState extends State<Noteslist> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(index.toString()),
              ),
              title: Text("title"),
              subtitle: Text("SubTitle"),
              trailing: Icon(Icons.delete),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNotes(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
