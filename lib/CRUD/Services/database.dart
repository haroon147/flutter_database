import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethods {
  Future addEmployeesDetails(
      Map<String, dynamic> employeesInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeesInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeesDetails()async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }
}
