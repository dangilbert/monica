import 'package:monica/core/data/model/user.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/user_request.dart';

class FakeUserRequest extends UserRequest {

  BinaryResult<User> nextResult = BinaryResult.success(value: null);

  @override
  Future<BinaryResult<User>> getUser() async {
    return nextResult;
  }
}
