import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  FirebaseFirestore firestore;
  Firestore._privateConstructor(){
    firestore ??= FirebaseFirestore.instance;
  }
  static final Firestore _instance = Firestore._privateConstructor();
  static Firestore get instance => _instance;

  CollectionReference getCollection(String collectionName){
    return firestore.collection(collectionName);
  }

  Future<void> insertDocument(String collectionName, Map<String, dynamic> object){
    getCollection(collectionName).doc("toto").set(object, SetOptions(merge: true));
  }

  Future<DocumentSnapshot> getDocumentById(String id, String collectionName){
    return getCollection(collectionName).doc(id).get();
  }

  Future<void> deleteDocumentById(String id, String collectionName){
    getCollection(collectionName).doc(id).delete();
  }
}