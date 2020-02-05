import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/meta.dart';
import 'package:monica/core/networking/binary_result.dart';
import 'package:monica/core/networking/client.dart';

class ContactsRequest {
  MonicaClient _client;

  ContactsRequest({@required MonicaClient client}) {
    _client = client;
  }

  Future<BinaryResult<List<Contact>>> getContacts() async {
    var currentPage = 0;
    var lastPage = 1;
    List<Contact> contacts = [];
    while (currentPage < lastPage) {
      var result = await _client.get("contacts",
          params: {"limit": "100", "page": "${currentPage + 1}"});
      if (result is BinaryResultSuccess) {
        try {
          var contactsJson = jsonDecode(result.value)['data'];
          contacts.addAll(contactsJson.toList().map<Contact>((contactJson) {
            return Contact.fromMap(contactJson);
          }).toList());

          var metaJson = jsonDecode(result.value)['meta'];
          var meta = Meta.fromMap(metaJson);
          currentPage = meta.currentPage;
          lastPage = meta.lastPage;
        } catch (err) {
          // TODO inject logger
          return BinaryResult.failure(exception: err);
        }
      } else {
        return BinaryResult.failure();
      }
    }
    return BinaryResult.success(value: contacts);
  }
}
