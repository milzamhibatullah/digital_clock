import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStoragePreference {
  static const String IS_SKIP_PERSONALIZE = 'IS_SKIP_PERSONALIZE';
  static const String DONE_PERSONALIZE = 'DONE_PERSONALIZE';
  static const String USERNAME = 'USERNAME';
  final _storage = const FlutterSecureStorage();

  void setIsSkip() async =>
      await _storage.write(key: IS_SKIP_PERSONALIZE, value: 'true');

  void setDonePersonalize() async =>
      await _storage.write(key: DONE_PERSONALIZE, value: 'true');

  void setUsername(name) async =>
      await _storage.write(key: USERNAME, value: name);

  getIsSkip() async {
    return await _storage.read(key: IS_SKIP_PERSONALIZE);
  }

  getDonePersonalize() async {
    return await _storage.read(key: DONE_PERSONALIZE);
  }

  getUserName() async {
    return await _storage.read(key: USERNAME);
  }
}

final prefs = LocalStoragePreference();
