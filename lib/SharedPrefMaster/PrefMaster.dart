import 'package:flutter/material.dart';
import 'package:flutter_database/SharedPrefMaster/sharedClass.dart';

class PrefMaster extends StatefulWidget {
  const PrefMaster({super.key});

  @override
  State<PrefMaster> createState() => _PrefMasterState();
}

class _PrefMasterState extends State<PrefMaster> {
  @override
  void initState() {
    number = Myprefences.getNumber();
    check = Myprefences.getBool();
    selectedItem = Myprefences.getList();
    super.initState();
  }

  int number = 0;
  bool check = false;
  List<String> students = ["Ali", "Usman", "Mohsin", "Asim"];
  List<String> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            number.toString(),
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 34),
          ),
          Container(
            width: double.infinity,
            color: Colors.pink,
            child: TextButton(
              onPressed: () {
                setState(() {
                  number++;
                  Myprefences.setNumber(number);
                });
              },
              child: const Text("Increment"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CheckboxListTile(
            value: check,
            onChanged: (value) {
              setState(() {
                check = !check;
                Myprefences.setBool(check);
              });
            },
            title: const Text("TRUE/FALSE"),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return CheckboxListTile(
                value: selectedItem.contains(students[index]),
                onChanged: (v) {
                setState(() {
                  if (selectedItem.contains(students[index])) {
                    selectedItem.remove(students[index]);
                  } else {
                    selectedItem.add(students[index]);
                  }
                });
                },
                title: Text(students[index]),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              print(selectedItem);
              Myprefences.SaveList(selectedItem);
            },
            child: const Text("Save Data"),
          ),
        ]),
      ),
    );
  }
}
