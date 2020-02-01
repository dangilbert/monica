import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/contacts_request.dart';

class ContactsRepo {
  ContactsRequest _request = GetIt.instance.get();

  StreamController<List<Contact>> _contacts = StreamController();
  Stream contacts;

  Map<int, StreamController<Contact>> _contactStreamControllers = {};

  ContactsRepo() {
    contacts = _contacts.stream.asBroadcastStream();
  }

  Stream<Contact> contact(int contactId) {
    return _streamController(contactId).stream.asBroadcastStream();
  }

  StreamController<Contact> _streamController(int contactId) =>
      _contactStreamControllers.putIfAbsent(
          contactId, () => StreamController<Contact>());

  Future<BinaryResult<void>> loadContacts() async {
    BinaryResult<List<Contact>> contactsResult = await _request.getContacts();
    return contactsResult
      ..onSuccess((contacts) {
        // TODO persist the contacts
        _contacts.add(contacts);
      });
  }

  Future<BinaryResult<void>> loadContact(int contactId) async {
    BinaryResult<List<Contact>> contactsResult = await _request.getContacts();
    var result = contactsResult;
    contactsResult
      ..onSuccess((contacts) {
        if (!contacts.any((c) => c.id == contactId)) {
          result = BinaryResult.failure();
        }
        contacts.forEach((contact) {
          // These are closed in the dispose method
          // ignore: close_sinks
          var streamController = _streamController(contact.id);
          if (streamController != null) {
            streamController.add(contact);
          }
        });
      });
    return result;
  }

  void dispose() {
    _contactStreamControllers.values
        .forEach((controller) => controller.close());
    _contactStreamControllers.clear();
  }
}
