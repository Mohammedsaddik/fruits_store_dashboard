import 'dart:io';
import 'package:fruits_hub_dashboard/core/services/storeage_services.dart';
import 'package:fruits_hub_dashboard/costant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as p;

class subaBaseStoreageService implements StoreageService {
  static late Supabase subaPase;
  @override
  static createBucket(String buckeName) async {
    var buckets = await subaPase.client.storage.listBuckets();
    bool isbucketExist = false;
    for (var bucket in buckets) {
      if (bucket.id == buckeName) {
        isbucketExist = true;
        break;
      }
    }
    if (!isbucketExist) {
      await subaPase.client.storage.createBucket(buckeName);
    }
  }

  static initSupaBase() async {
    subaPase = await Supabase.initialize(
      url: KSupaBaseUrl,
      anonKey: KSupaBaseKey,
    );
  }

  @override
  Future<String> uploadeFile(File file, String path) async {
    String fileName = p.basenameWithoutExtension(file.path);
    String extensionName = p.extension(file.path);
    var resutl = await subaPase.client.storage
        .from('fruit_images')
        .upload('$path/$fileName$extensionName', file);
    final String publicUrl = subaPase.client.storage
        .from('fruit_images')
        .getPublicUrl('$path/$fileName$extensionName');

    return publicUrl;
  }
}
