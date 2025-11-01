import 'package:hive_flutter/hive_flutter.dart';

abstract class CacheHelper {
  static const String userModelBox = 'userModelBox';
  static setUpCache() async {
    await Hive.initFlutter();
    await Future.wait([Hive.openBox(userModelBox)]);
  }
}

class CacheServices {
  T? getDataFromCache<T>({required String boxName, required String key}) {
    return Hive.box(boxName).get(key, defaultValue: null);
  }

  storeData<T>({
    required String boxName,
    required String key,
    required T data,
  }) {
    Hive.box(boxName).put(key, data);
  }

  clear(String boxName) {
    Hive.box(boxName).clear();
  }
}
