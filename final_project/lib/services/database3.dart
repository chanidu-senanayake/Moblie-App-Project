import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods3 {
  Future addHeavyDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getHeavyDetails() async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .snapshots();
  }

  Future updateHeavyDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteHeavyDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("HeavyParts")
        .doc(id)
        .delete();
  }
}
