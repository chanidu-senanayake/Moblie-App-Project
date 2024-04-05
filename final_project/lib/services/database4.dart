import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods4 {
  Future addCustomerDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getCustomerDetails() async {
    return await FirebaseFirestore.instance.collection("Customer").snapshots();
  }

  Future updateCustomerDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteCustomerDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Customer")
        .doc(id)
        .delete();
  }
}
