
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FakeFlutterSecureStorage extends FlutterSecureStorage {

  Map<String, String> store = {};

  @override
  Future<void> write({@required String key, @required String value, iOSOptions iOptions, AndroidOptions aOptions}) async => store[key] = value;

  @override
  Future<String> read({@required String key, iOSOptions iOptions, AndroidOptions aOptions}) async => store[key];

  @override
  Future<void> deleteAll({iOSOptions iOptions, AndroidOptions aOptions}) async => store.clear();

}