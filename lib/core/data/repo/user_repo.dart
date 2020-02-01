import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/user.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/user_request.dart';

class UserRepo {

  UserRequest _request = GetIt.instance.get();

  StreamController<User> _user = StreamController();
  Stream user;

  UserRepo() {
      user = _user.stream.asBroadcastStream();
  }

  Future<BinaryResult<void>> loadUser() async {
    BinaryResult<User> userResult = await _request.getUser();
    if (userResult is BinaryResultSuccess) {
        // TODO persist the user
        BinaryResultSuccess<User> successResult = userResult;
        _user.add(successResult.value);
    }
    return userResult;
  }

}