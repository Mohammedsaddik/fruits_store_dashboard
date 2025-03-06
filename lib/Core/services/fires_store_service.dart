import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_store_dashboard/Core/services/DataBaseService.dart';

class FireBaseService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docimentId,
  }) async {
    if (docimentId != null) {
      await firestore.collection(path).doc(docimentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(
      {required String path, required String DocusUid}) async {
    var data = await firestore.collection(path).doc(DocusUid).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> CheckisDataExiext(
      {required String path, required String DocusUid}) async {
    var data = await firestore.collection(path).doc(DocusUid).get();
    return data.exists;
  }

  @override
  Stream streamData(
      {required String path, Map<String, dynamic>? query}) async* {
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderByField, descending: descending);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for (var result in data.snapshots()) {
      yield result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    await firestore.collection(path).doc(documentId).update(data);
  }
}
