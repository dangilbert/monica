import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/life_event.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';
import 'package:monica/core/data/repo/dashboard_repo.dart';
import 'package:monica/core/data/repo/life_events_repo.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/contacts_request.dart';
import 'package:monica/core/networking/request/life_events_request.dart';

import '../../../fakes/request/fake_contacts_request.dart';
import '../../../fakes/request/fake_life_events_request.dart';

void main() {
  FakeContactsRequest contactsRequest;
  FakeLifeEventsRequest lifeEventsRequest;

  Contact contact1 = Contact(id: 1, firstName: "Test1");
  Contact contact2 = Contact(id: 2, firstName: "Test2");

  LifeEvent lifeEvent1 = LifeEvent(id: 1, name: "Life event 1");
  LifeEvent lifeEvent2 = LifeEvent(id: 2, name: "Life event 2");

  setUp(() async {
    contactsRequest = FakeContactsRequest();
    lifeEventsRequest = FakeLifeEventsRequest();
    // ignore: unnecessary_cast
    GetIt.instance.registerSingleton(contactsRequest as ContactsRequest);
    // ignore: unnecessary_cast
    GetIt.instance.registerSingleton(lifeEventsRequest as LifeEventsRequest);

    GetIt.instance.registerSingleton(ContactsRepo());
    GetIt.instance.registerSingleton(LifeEventsRepo());
  });

  tearDown(() async {
    GetIt.instance.reset();
  });

  test(
      'on fetch contacts and contacts repo returns success, returns BinaryResultSuccess',
      () async {
    var subject = DashboardRepo();
    expect(await subject.fetchContacts(), isInstanceOf<BinaryResultSuccess>());
  });

  test(
      'on fetch contacts and contacts repo returns failure, returns BinaryResultSuccess',
      () async {
    var subject = DashboardRepo();
    contactsRequest.nextResult = BinaryResult.failure();
    expect(await subject.fetchContacts(), isInstanceOf<BinaryResultFailure>());
  });

  test(
      'on fetch contacts and contacts repo returns success, exposes contacts on stream',
      () async {
    var subject = DashboardRepo();
    var result = expectLater(subject.contacts, emits([contact1, contact2]));

    contactsRequest.nextResult =
        BinaryResult.success(value: [contact1, contact2]);
    subject.fetchContacts();

    await result;
  });

  test(
      'on fetch life events and life events repo returns success, returns BinaryResultSuccess',
      () async {
    var subject = DashboardRepo();
    expect(await subject.fetchLifeEvents(), isInstanceOf<BinaryResultSuccess>());
  });

  test(
      'on fetch life events and life events repo returns failure, returns BinaryResultSuccess',
      () async {
    var subject = DashboardRepo();
    lifeEventsRequest.nextResult = BinaryResult.failure();
    expect(await subject.fetchLifeEvents(), isInstanceOf<BinaryResultFailure>());
  });

  test(
      'on fetch life events and life events repo returns success, exposes life events on stream',
      () async {
    var subject = DashboardRepo();
    var result = expectLater(subject.lifeEvents, emits([lifeEvent1, lifeEvent2]));

    lifeEventsRequest.nextResult =
        BinaryResult.success(value: [lifeEvent1, lifeEvent2]);
    subject.fetchLifeEvents();

    await result;
  });
}
