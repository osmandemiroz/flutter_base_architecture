import 'package:core/src/cache/core/index.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

///Hive cache manager for caching data
final class HiveCacheManager extends CacheManager {
  HiveCacheManager({super.path});

  @override
  Future<void> init({required List<CacheModel> items}) async {
    WidgetsFlutterBinding.ensureInitialized();
    final documentPath =
        path ?? (await getApplicationDocumentsDirectory()).path;
    Hive.defaultDirectory = documentPath;

    for (final item in items) {
      Hive.registerAdapter(
        '${item.runtimeType}',
        item.fromDynamicJson,
      );
    }
  }

  @override
  void remove() {
    Hive.deleteAllBoxesFromDisk();
  }
}
