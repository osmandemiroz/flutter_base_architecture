import 'package:core/index.dart';
import 'package:flutter_architecture_template/product/cache/model/user_cache_model.dart';

/// [ProductCache] is a cache manager for product cache
final class ProductCache {
  ProductCache({required CacheManager cacheManager})
      : _cacheManager = cacheManager;

  final CacheManager _cacheManager;

  Future<void> init() async {
    await _cacheManager.init(
      items: [
        UserCacheModel.empty(),
      ],
    );
  }

  late final HiveCacheOperation<UserCacheModel> userCacheOperation =
      HiveCacheOperation<UserCacheModel>();
}
