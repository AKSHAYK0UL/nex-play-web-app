import 'package:nex_play/core/cache/cache_service_interface/cache_service_interface.dart';

class MovieCacheService<K, V> implements CacheServiceInterface<K, V> {
  final Map<K, V> _cache = {};

  @override
  Future<void> put(K key, V value) async {
    _cache[key] = value;
  }

  @override
  V? get(K key) => _cache[key];

  @override
  bool contains(K key) => _cache.containsKey(key);

  @override
  Future<void> remove(K key) async {
    _cache.remove(key);
  }

  @override
  Future<void> clear() async {
    _cache.clear();
  }
}
