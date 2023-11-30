import 'package:core/index.dart';
import 'package:flutter_architecture_template/product/cache/model/user_cache_model.dart';
import 'package:mockito/mockito.dart';

class UserCacheMock extends Mock implements HiveCacheOperation<UserCacheModel> {
  final List<UserCacheModel> _list = [];
  @override
  void add(UserCacheModel item) {
    _list.add(item);
  }

  @override
  List<UserCacheModel> getAll() {
    return _list;
  }
}
