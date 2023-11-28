import 'package:core/src/cache/core/cache_model.dart';

abstract class CacheOperation<T extends CacheModel> {
  void add(T item);
  void addAll(List<T> items);
  void delete(T item);
  void deleteAll(List<T> items);
  void clear();

  List<T> getAll();
  T? get(String id);
}
