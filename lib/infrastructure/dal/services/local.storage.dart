import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStoragePreference {
  static const String DONE_PERSONALIZE = 'DONE_PERSONALIZE';
  static const String USERNAME = 'USERNAME';
  final _storage = const FlutterSecureStorage();



  void setDonePersonalize() async =>
      await _storage.write(key: DONE_PERSONALIZE, value: 'true');

  void setUsername(name) async =>
      await _storage.write(key: USERNAME, value: name);

  getDonePersonalize() async {
    return await _storage.read(key: DONE_PERSONALIZE);
  }

  getUserName() async {
    return await _storage.read(key: USERNAME);
  }
}

final prefs = LocalStoragePreference();
