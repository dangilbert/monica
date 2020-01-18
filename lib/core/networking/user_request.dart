
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:monica/core/data/user.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/client.dart';

class UserRequest {

  MonicaClient _client;

  UserRequest({@required MonicaClient client}) {
    _client = client;
  }

  Future<BinaryResult<User>> getUser() async {
    try {
      var result = await _client.get("me");
      var user = User.fromJson(jsonDecode(result.body));
      return BinaryResult.success(value: user);
    } catch (err) {
      print(err);
    }
    return BinaryResult.failure();
  }

}