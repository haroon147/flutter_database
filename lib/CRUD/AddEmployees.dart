import 'package:flutter/material.dart';
import 'package:flutter_database/CRUD/Services/database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

class Addemployees extends StatefulWidget {
  const Addemployees({super.key});

  @override
  State<Addemployees> createState() => _AddemployeesState();
}

class _AddemployeesState extends State<Addemployees> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CRUD Employee Form"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Age",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: TextField(
                    controller: ageController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Location",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w900),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: TextField(
                    controller: locationController,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                    child: ElevatedButton(
                        onPressed: () async {
                          String id = randomAlphaNumeric(10);
                          Map<String, dynamic> employeesInfoMap = {
                            "Name": nameController.text,
                            "Age": ageController.text,
                            "Id": id,
                            "location": locationController.text,
                          };
                          await DatabaseMethods()
                              .addEmployeesDetails(employeesInfoMap, id).then((value){
                            Fluttertoast.showToast(
                                msg: "Data Is Added Sucessfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          });
                        },
                        child: const Text("Add")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
