import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _fireStore = Firestore.instance;

  Stream<QuerySnapshot> getMenu(String id) {
    return _fireStore
        .collection('menu')
        .where('id', isEqualTo: id)
        .snapshots();
  }

   Stream<QuerySnapshot> getType(String type) {
    return _fireStore
        .collection('menu')
        .where('type', isEqualTo: type)
        .snapshots();
  }
}
