import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/user.dart';
import 'package:monica/core/data/repo/user_repo.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/user_request.dart';

import '../../../fakes/request/fake_user_request.dart';

void main() {
  
  FakeUserRequest userRequest;

  User user1 = User(data: Data(id: 1, firstName: "Test1"));

  setUp(() async {
    userRequest = FakeUserRequest();
    //ignore: unnecessary_cast
    GetIt.instance.registerSingleton(userRequest as UserRequest);
  });

  tearDown(() async {
    GetIt.instance.reset();
  });

  test('get user, when api succeeds, returns binary result success', () async {
    var subject = UserRepo();
    expect(await subject.loadUser(), isInstanceOf<BinaryResultSuccess>());
  });

  test('get user, when api succeeds, returns user', () async {
    var subject = UserRepo();
    userRequest.nextResult = BinaryResult.success(value: user1);
    var result = await subject.loadUser();
    expect((result as BinaryResultSuccess).value, user1);
  });

  test('get user, when api fails, returns binary result failure', () async {
    var subject = UserRepo();
    userRequest.nextResult = BinaryResult.failure();
    expect(await subject.loadUser(), isInstanceOf<BinaryResultFailure>());
  });

}