import 'package:core/src/cache/hive/hive_cache_operation.dart';
import 'package:core/src/cache/hive/hive_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';

import 'core/hive_common_test.dart';
import 'user_cache.dart';

void main() {
  setUp(() async {
    await initTests();
    final cacheManager = HiveCacheManager(
      path: 'test/hive',
    );
    await cacheManager.init(
      items: [
        UserCache.empty(),
      ],
    );
  });
  test('add data to local database', () {
    final userCacheOperation = HiveCacheOperation<UserCache>();

    userCacheOperation.add(
      UserCache(
        id: '1',
        name: 'kero',
      ),
    );
    final item = userCacheOperation.get(
      '1',
    );
    expect(item, isNotNull);
  });
}
