import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_store_dashboard/Core/services/storeage_services.dart';
import 'package:path/path.dart' as p;

class FireStorge implements StoreageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadeFile(File file, String path) async {
    String fileName = p.basenameWithoutExtension(file.path);
    String extensionName = p.extension(file.path);
    var imagesRef = storageRef.child('$path/$fileName$extensionName');
    await imagesRef.putFile(file);
    var ImageUrl = await imagesRef.getDownloadURL();
    return ImageUrl;
  }
}
