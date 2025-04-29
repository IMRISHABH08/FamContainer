import 'package:shared_preferences/shared_preferences.dart';

import 'local_cache.dart';

class SharedLocalCache implements LocalCache {
  SharedLocalCache(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> clear() async => _preferences.clear();

  @override
  Future<bool> containsKey(String key) async => _preferences.containsKey(key);

  @override
  Future<void> deleteEntry(String key) async => _preferences.remove(key);

  @override
  Future<T?> getValue<T>(String key) async {
    if (T == String) {
      return _preferences.getString(key) as T?;
    } else if (T == bool) {
      return _preferences.getBool(key) as T?;
    } else if (T == int) {
      return _preferences.getInt(key) as T?;
    } else if (T == double) {
      return _preferences.getDouble(key) as T?;
    } else if (T == List<String>) {
      return _preferences.getStringList(key) as T?;
    } else {
      throw const InvalidTypeParameter();
    }
  }

  @override
  Future<void> initialise() async {}

  @override
  Future<void> setValue<T>(String key, T value) async {
    if (T == String) {
      await _preferences.setString(key, value as String);
    } else if (T == bool) {
      await _preferences.setBool(key, value as bool);
    } else if (T == int) {
      await _preferences.setInt(key, value as int);
    } else if (T == double) {
      await _preferences.setDouble(key, value as double);
    } else if (T == List<String>) {
      await _preferences.setStringList(key, value as List<String>);
    } else {
      throw const InvalidTypeParameter();
    }
  }
}