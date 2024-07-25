import 'package:shared_preferences/shared_preferences.dart';

/// 枚举常量
enum StorageKeys {
  token, // 令牌, StorageKeys.token.toString后: "StorageKeys.token"
  apiKey, // 接口密钥
}

/// 定义持久化单例(shared_preferences实例化为异步方法)
class Storage {
  static Storage? _instance;

  /// 单例模式(它属于类本身，而不是类的实例),
  static late SharedPreferences _storage;

  /// 缓存实例，用户操作缓存方法

  Storage._internal();

  /// 私有构造函数, 确保只有一个 Storage 类被创建

  static Future<Storage> getInstance() async {
    if (_instance == null) {
      _instance = Storage._internal();
      _storage = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  /// 获取指定key对应的值
  static getString(StorageKeys key) {
    return _storage.get(key.toString());
  }

  /// 设置指定key对应的值
  static setString(StorageKeys key, String value) {
    return _storage.setString(key.toString(), value);
  }

  /// 获取指定key对应的值(集合类型)
  static getStringList(StorageKeys key) {
    return _storage.getStringList(key.toString());
  }

  /// 设置指定key对应的值(集合类型)
  static setStringList(StorageKeys key, List<String> value) {
    return _storage.setStringList(key.toString(), value);
  }
}
