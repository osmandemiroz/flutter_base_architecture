import 'package:core/src/cache/core/index.dart';
import 'package:hive/hive.dart';

///Hive cache operation for caching data
final class HiveCacheOperation<T extends CacheModel> extends CacheOperation<T> {
  ///Constructor for [HiveCacheOperation]
  HiveCacheOperation() {
    _box = Hive.box<T>(name: '$T');
  }
  late final Box<T> _box;
  @override
  void add(T item) {
    _box.put(item.id, item);
  }

  @override
  void addAll(List<T> items) {
    _box.putAll(Map.fromIterable(items));
  }

  @override
  void clear() {
    _box.clear();
  }

  @override
  void delete(T item) {
    _box.delete(item.id);
  }

  @override
  void deleteAll(List<T> items) {
    _box.deleteAll(items.map((e) => e.id).toList());
  }

  @override
  T? get(String id) {
    return _box.get(id);
  }

  @override
  List<T> getAll() {
    return _box
        .getAll(_box.keys)
        .where((element) => element != null)
        .cast<T>()
        .toList();
  }
}
