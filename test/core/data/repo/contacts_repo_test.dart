import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/repo/contacts_repo.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/contacts_request.dart';
import '../../../fakes/request/fake_contacts_request.dart';

void main() {
  FakeContactsRequest request;

  Contact contact1 = Contact(id: 1, firstName: "Test1");
  Contact contact2 = Contact(id: 2, firstName: "Test2");

  setUp(() {
    request = FakeContactsRequest();
    // ignore: unnecessary_cast
    GetIt.instance.registerSingleton(request as ContactsRequest);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  test('on load contacts and api success returns success binary result',
      () async {
    var subject = ContactsRepo();
    expect(await subject.loadContacts(), isInstanceOf<BinaryResultSuccess>());
  });

  test('on load contacts and api success publishes the contacts to the stream',
      () async {
    var subject = ContactsRepo();
    request.nextResult = BinaryResult.success(value: [contact1, contact2]);
    var result = expectLater(subject.contacts, emits([contact1, contact2]));

    subject.loadContacts();

    await result;
  });

  test(
    'on load contacts and api failure returns failure binary result',
    () async {
      var subject = ContactsRepo();
      request.nextResult = BinaryResult.failure();
      expect(await subject.loadContacts(), isInstanceOf<BinaryResultFailure>());
    },
  );

  test('on load contact and api success returns success binary result',
      () async {
    var subject = ContactsRepo();
    request.nextResult = BinaryResult.success(value: [contact1, contact2]);
    expect(await subject.loadContact(contact1.id),
        isInstanceOf<BinaryResultSuccess>());
  });

  test(
    'on load contact and api success publishes the contact to the stream',
    () async {
      var subject = ContactsRepo();
      request.nextResult = BinaryResult.success(value: [contact1, contact2]);
      var result = expectLater(subject.contact(contact1.id), emits(contact1));

      subject.loadContact(contact1.id);

      await result;
    },
  );

  test(
    'on load contact and api failure returns failure binary result',
    () async {
      var subject = ContactsRepo();
      request.nextResult = BinaryResult.failure();
      expect(await subject.loadContact(contact1.id),
          isInstanceOf<BinaryResultFailure>());
    },
  );

  test(
    'on load contact and contact does not exist returns failure binary result',
    () async {
      var subject = ContactsRepo();
      request.nextResult = BinaryResult.success(value: [contact1, contact2]);
      expect(await subject.loadContact(3), isInstanceOf<BinaryResultFailure>());
    },
  );
}
