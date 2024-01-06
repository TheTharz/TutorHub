import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }
}
