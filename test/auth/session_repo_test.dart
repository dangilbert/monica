import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/auth/session.dart';

import '../fakes/fake_flutter_secure_storage.dart';

void main() {

  FakeFlutterSecureStorage secureStorage = FakeFlutterSecureStorage();

  Session testSession = Session(host: "host", token: "token");

  setUp((){
    //ignore: unnecessary_cast
    GetIt.instance.registerSingleton(secureStorage as FlutterSecureStorage);
  });

  tearDown(() async {
    await secureStorage.deleteAll();
    GetIt.instance.reset();
  });

  test('get session returns null when no session has been stored', () async {
    var subject = SessionRepo();
    expect(await subject.getSession(), null);
  });

test('get session returns valid session when session has been stored', () async {
    var subject = SessionRepo();
    await secureStorage.write(key: SessionRepo.HOST_KEY, value: testSession.host);
    await secureStorage.write(key: SessionRepo.TOKEN_KEY, value: testSession.token);
    expect(await subject.getSession(), testSession);
  });

  test('get session returns null when logout is called', () async {
    var subject = SessionRepo();
    await secureStorage.write(key: SessionRepo.HOST_KEY, value: testSession.host);
    await secureStorage.write(key: SessionRepo.TOKEN_KEY, value: testSession.token);
    expect(await subject.getSession(), testSession);

    await subject.logout();
    expect(await subject.getSession(), null);
  });

  test('set session writes session values to storage', () async {
    var subject = SessionRepo();
    await subject.setSession(Session(host: "host", token: "token"));

    expect(secureStorage.store[SessionRepo.HOST_KEY], "host");
    expect(secureStorage.store[SessionRepo.TOKEN_KEY], "token");
  });
}