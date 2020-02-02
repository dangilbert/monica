import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:monica/auth/session.dart';
import 'package:monica/core/data/model/api_health.dart';
import 'dart:convert';

import 'package:monica/core/networking/binary_result.dart';

class MonicaClient {
  var client = http.Client();

  SessionRepo sessionRepo;

  MonicaClient({@required this.sessionRepo});

// TODO move login to its own repo
  Future<bool> sessionIsValid() async {
    var session = await sessionRepo.getSession();
    if (session == null) {
      return false;
    }

    // Check the connection to the server
    return await _canConnect(host: session.host, token: session.token);
  }

  Future<bool> login({String host, String token}) async {
    try {
      var result = await _canConnect(host: host, token: token);
      if (result) {
        sessionRepo.setSession(Session(host: host, token: token));
      }
      return result;
    } catch (err) {
      return false;
    }
  }

  Future<bool> _canConnect(
      {@required String host, @required String token}) async {
    var result = await client.get("$host/api",
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"});
    try {
      var apiHealth = ApiHealth.fromJson(jsonDecode(result.body));
      if (apiHealth.success != null) {
        return true;
      }
    } catch (err) {}
    return false;
  }

  Future<BinaryResult<dynamic>> get(String path,
      {Map<String, String> headers, Map<String, String> params}) async {
    var session = await sessionRepo.getSession();
    if (headers == null) {
      headers = {};
    }
    headers[HttpHeaders.authorizationHeader] = "Bearer ${session.token}";
    try {
      var host = session.host.split("://");
      var scheme = host[0];
      var authority = host[1];
      var uri;
      if (scheme == "http") {
        uri = Uri.http(authority, "api/$path", params);
      } else {
        uri = Uri.https(authority, "api/$path", params);
      }
      var response = await client.get(uri, headers: headers);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return BinaryResult.success(value: response.body);
      } else {
        return BinaryResult.failure();
      }
    } catch (err) {
      // TODO add a logger for debug builds
      return BinaryResult.failure(exception: err);
    }
  }
}
