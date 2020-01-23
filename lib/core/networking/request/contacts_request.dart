import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/client.dart';

class ContactsRequest {
  MonicaClient _client;

  ContactsRequest({@required MonicaClient client}) {
    _client = client;
  }

  Future<BinaryResult<List<Contact>>> getContacts() async {
    try {
      var result = await _client.get("contacts");
      var contactsJson = jsonDecode(result.body)['data'];
      List<Contact> contacts =
          contactsJson.toList().map<Contact>((contactJson) {
            return Contact.fromJson(contactJson);
          }).toList();
      return BinaryResult.success(value: contacts);
    } catch (err) {
      print(err);
    }
    return BinaryResult.failure();
  }
}
