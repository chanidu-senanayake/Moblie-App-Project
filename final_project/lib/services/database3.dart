import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods3 {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .snapshots();
  }

  Future updateEmployeeDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .delete();
  }
}
