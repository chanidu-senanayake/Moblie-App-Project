import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods2 {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .snapshots();
  }

  Future updateEmployeeDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .delete();
  }
}
