import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addBikeDetails(Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("BikeParts")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getBikeDetails() async {
    return await FirebaseFirestore.instance.collection("BikeParts").snapshots();
  }

  Future updateBikeDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("BikeParts")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteBikeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("BikeParts")
        .doc(id)
        .delete();
  }
}
