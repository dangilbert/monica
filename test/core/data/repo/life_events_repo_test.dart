import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/data/repo/life_events_repo.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/life_events_request.dart';

import '../../../fakes/request/fake_life_events_request.dart';

void main() {
  FakeLifeEventsRequest lifeEventsRequest;

  LifeEvent lifeEvent1 = LifeEvent(id: 1, name: "Life event 1");
  LifeEvent lifeEvent2 = LifeEvent(id: 2, name: "Life event 2");

  setUp(() async {
    lifeEventsRequest = FakeLifeEventsRequest();
    // ignore: unnecessary_cast
    GetIt.instance.registerSingleton(lifeEventsRequest as LifeEventsRequest);
  });

  tearDown(() async {
    GetIt.instance.reset();
  });

  test(
      'on fetch life events and life events repo returns success, returns BinaryResultSuccess',
      () async {
    var subject = LifeEventsRepo();
    expect(await subject.loadLifeEvents(), isInstanceOf<BinaryResultSuccess>());
  });

  test(
      'on fetch life events and life events repo returns failure, returns BinaryResultSuccess',
      () async {
    var subject = LifeEventsRepo();
    lifeEventsRequest.nextResult = BinaryResult.failure();
    expect(await subject.loadLifeEvents(), isInstanceOf<BinaryResultFailure>());
  });

  test(
      'on fetch life events and life events repo returns success, exposes life events on stream',
      () async {
    var subject = LifeEventsRepo();
    var result = expectLater(subject.lifeEvents, emits([lifeEvent1, lifeEvent2]));

    lifeEventsRequest.nextResult =
        BinaryResult.success(value: [lifeEvent1, lifeEvent2]);
    subject.loadLifeEvents();

    await result;
  });
}
