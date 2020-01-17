import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:monica/auth/session.dart';
import 'package:monica/core/networking/api_health.dart';
import 'dart:convert';

class MonicaClient {
  var client = http.Client();

  SessionRepo _sessionRepo = GetIt.instance.get();

  Future<bool> sessionIsValid() async {
    var session = await _sessionRepo.getSession();
    if (session == null) {
      return false;
    }

    // Check the connection to the server
    return await _canConnect(host: session.host, token: session.token);
  }

  Future<bool> login({String host, String token}) async {
    var result = await _canConnect(host: host, token: token);
    if (result) {
      _sessionRepo.setSession(Session(host: host, token: token));
    }
    return result;
  }

  Future<bool> _canConnect({@required String host, @required String token}) async {
    var result = await client.get(
      "$host/api",
      headers: {HttpHeaders.authorizationHeader: "Bearer $token"}
      );
    try {
      var apiHealth = ApiHealth.fromJson(jsonDecode(result.body));
      if (apiHealth.success != null) {
        return true;
      }
    } catch (err) {}
    return false;
  }
}
