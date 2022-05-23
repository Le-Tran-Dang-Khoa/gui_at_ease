import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class StorageHelper {
  static final instance = StorageHelper._singleton();
  StorageHelper._singleton() : super();

  Future<String> loadFromAssetFile(String assetFilePath) async =>
      rootBundle.loadString(assetFilePath);

  Future<File> openAppDocFile(String docFilePath) async {
    var docDir = await getApplicationDocumentsDirectory();
    return File('$docDir/$runtimeType');
  }
}
