
import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/request/contacts_request.dart';

class ContactsRepo {

  ContactsRequest _request = GetIt.instance.get();

  StreamController<List<Contact>> _contacts = StreamController();
  Stream contacts;

  ContactsRepo() {
      contacts = _contacts.stream.asBroadcastStream();
  }

  Future<BinaryResult<void>> loadContacts() async {
    BinaryResult<List<Contact>> contactsResult = await _request.getContacts();
    if (contactsResult is BinaryResultSuccess) {
        // TODO persist the contacts
        BinaryResultSuccess<List<Contact>> successResult = contactsResult;
        _contacts.add(successResult.value);
    }
    return contactsResult;
  }

}