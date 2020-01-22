import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FirestoreService {
  static final instance = FirestoreService._();
  FirestoreService._();

  Stream<List<T>> collectionStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.documents.map((snapshot) =>
            builder(snapshot.data)).toList());
  }

  Stream<List<T>> collectionStreamById<T>({
    @required List<String> idList,
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {

    final reference = Firestore.instance.collection(path);
    final snapshots = reference.where('uid', whereIn: idList).snapshots();
    return snapshots.map((snapshot) =>
        snapshot.documents.map((snapshot) =>
            builder(snapshot.data)).toList());
  }

  Future<Map<String, dynamic>> getDocument(String path) async {
    DocumentSnapshot snapshot = await Firestore.instance.document(path).get();

    return snapshot.data;
  }

  Future<void> setData({
    String path,
    Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
      print('$path: $data');  // for debugging
      await reference.setData(data);
  }

  Future<String> createDocument({
    String path,
    Map<String, dynamic> data}) async {
      final reference = await  Firestore.instance.collection(path).add(data);
      return reference.documentID;
  }

  Future<void> addToArrayField({
    String path,
    String field,
    List list}) async {
      Firestore.instance.document(path).updateData({field: FieldValue.arrayUnion(list)});
  }

  Stream<List<T>> search<T>({
    @required String searchString,
    @required String field,
    @required String path,
    @required T builder(Map<String, dynamic> data),
  }) {

    final reference = Firestore.instance.collection(path);
    final snapshots = reference.where(
                          field,
                          isGreaterThanOrEqualTo: searchString
                      ).snapshots();

    return snapshots.map((snapshot) =>
        snapshot.documents.map((snapshot) =>
            builder(snapshot.data)).toList());
  }
}