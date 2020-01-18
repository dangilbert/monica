import 'package:http/http.dart';
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
  Future<Response> get(String path, {Map<String, String> headers}) async {
    return Response("Error", 400);
  }
}
