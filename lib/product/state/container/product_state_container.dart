import 'package:core/index.dart';
import 'package:flutter_architecture_template/features/home/view_model/state/view_model/product_viewmodel.dart';
import 'package:flutter_architecture_template/product/cache/product_cache.dart';
import 'package:flutter_architecture_template/product/services/manager/product_service_manager.dart';
import 'package:get_it/get_it.dart';

///Product container core for dependencies injection
final class ProductContainer {
  ProductContainer._();
  static final _instance = GetIt.I;

  /// Product core required items
  static void setup() {
    _instance
      ..registerSingleton(ProductCache(cacheManager: HiveCacheManager()))
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  static T read<T extends Object>() => _instance<T>();
}
