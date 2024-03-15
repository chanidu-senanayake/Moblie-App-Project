import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods4 {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Customer").snapshots();
  }

  Future updateEmployeeDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .delete();
  }
}
