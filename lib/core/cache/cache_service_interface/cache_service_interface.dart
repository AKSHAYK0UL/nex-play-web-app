abstract interface class CacheServiceInterface<K, V> {
  V? get(K key);

  Future<void> put(K key, V value);

  bool contains(K key);

  Future<void> remove(K key);

  Future<void> clear();
}

