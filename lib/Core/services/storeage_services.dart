import 'dart:io';

abstract class StoreageService {
  Future<String> uploadeFile(File file, String path);
}
