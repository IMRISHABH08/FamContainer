abstract class LocalCache {
  Future<void> initialise();

  Future<void> setValue<T>(String key, T value);

  Future<bool> containsKey(String key);

  Future<T?> getValue<T>(String key);

  Future<void> deleteEntry(String key);

  Future<void> clear();
}

class InvalidTypeParameter implements Exception {
  const InvalidTypeParameter();
}
