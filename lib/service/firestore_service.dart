import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore;

  FirestoreService() : _firestore = FirebaseFirestore.instance;

  Future<void> addDocument(
      String collectionPath, Map<String, dynamic> data) async {
    await _firestore.collection(collectionPath).add(data);
  }

  Future<void> updateDocument(
      String documentId, Map<String, dynamic> data) async {
    await _firestore.collection('users').doc(documentId).update(data);
  }

  Future<void> deleteDocument(String documentId) async {
    await _firestore.collection('users').doc(documentId).delete();
  }

  Future<DocumentSnapshot> getDocument(String documentId) async {
    return await _firestore.collection('users').doc(documentId).get();
  }

  Future<QuerySnapshot> getAllDocuments() async {
    return await _firestore.collection('users').get();
  }
}
