import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods2 {
  Future addLightDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .set(employeeInfoMap);
  }

  Future<Stream<QuerySnapshot>> getLightDetails() async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .snapshots();
  }

  Future updateLightDetail(String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteLightDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("LightParts")
        .doc(id)
        .delete();
  }
}
