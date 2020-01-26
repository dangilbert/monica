import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/client.dart';

class FakeMonicaClient extends MonicaClient {

  static const String VALID_TOKEN = "validtoken";
  static const String INVALID_TOKEN = "invalidtoken";

  @override
  Future<bool> sessionIsValid() async {
    return false;
  }

  @override
  Future<bool> login({String host, String token}) async {
    switch(token) {
      case VALID_TOKEN:
        return true;
      default:
        return false;
    }
  }

  @override
  Future<BinaryResult<dynamic>> get(String path, {Map<String, String> headers, Map<String, String> params}) async {
    return BinaryResult.failure(exception: Exception("400 Client Error"));
  }
}
