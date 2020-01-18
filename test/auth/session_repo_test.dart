import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/auth/session.dart';

import '../fakes/fake_flutter_secure_storage.dart';

void main() {

  FlutterSecureStorage secureStorage = FakeFlutterSecureStorage();

  Session testSession = Session(host: "host", token: "token");

  setUp((){
    GetIt.instance.registerSingleton(secureStorage);
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
}