import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class Session {
  
  String host;
  String token;

  Session({ @required this.host, @required this.token });
}

class SessionRepo {

  static const String HOST_KEY = "host_key";
  static const String TOKEN_KEY = "token_key";

  FlutterSecureStorage _storage = GetIt.instance.get();

  Future<Session> getSession() async {
    String host = await _storage.read(key: HOST_KEY);
    String token = await _storage.read(key: TOKEN_KEY);
    if (host == null || token == null) {
      return null;
    } else {
      return Session(host: host, token: token);
    }
  }

  Future<void> setSession(Session session) async {
    _storage.write(key: HOST_KEY, value: session.host);
    _storage.write(key: TOKEN_KEY, value: session.token);
  }

  Future<void> logout() async {
    _storage.deleteAll();
  }

}