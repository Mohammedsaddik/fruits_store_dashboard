abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docimentId,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String DocusUid,
  });

  Future<bool> CheckisDataExiext({
    required String path,
    required String DocusUid,
  });
  Stream<dynamic> streamData({
    required String path,
    Map<String, dynamic>? query,
  });
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId});
}
