
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact/contact_field_type.dart';
import 'package:monica/core/data/model/contact/contact_fields.dart';

void main() {

  var testContactField = ContactField(
        id: 69,
        object: "contactfield",
        content: "asdfas",
        contactFieldType: ContactFieldType(
          id: 1,
          object: "contactfieldtype",
          name: "Email",
          fontawesomeIcon: "fa fa-envelope-open-o",
          protocol: "mailto:",
          delible: false,
          type: "email",
          account: Account(
            id: 1
          ),
          createdAt: "2020-01-19T15:06:17Z",
          updatedAt: "2020-01-19T15:06:17Z"
        ),
        account: Account(
          id: 1
        ),
        contact: null,
        createdAt: "2020-01-31T22:08:03Z",
        updatedAt: "2020-01-31T22:08:03Z"
      );

  var testContactFieldJson = """
    {
        "id": 69,
        "object": "contactfield",
        "content": "asdfas",
        "contact_field_type": {
          "id": 1,
          "object": "contactfieldtype",
          "name": "Email",
          "fontawesome_icon": "fa fa-envelope-open-o",
          "protocol": "mailto:",
          "delible": false,
          "type": "email",
          "account": {
            "id": 1
          },
          "created_at": "2020-01-19T15:06:17Z",
          "updated_at": "2020-01-19T15:06:17Z"
        },
        "account": {
          "id": 1
        },
        "contact": null,
        "created_at": "2020-01-31T22:08:03Z",
        "updated_at": "2020-01-31T22:08:03Z"
      }
  """;

test('valid ContactField json decoded correctly', () async {
    expect(ContactField.fromJson(testContactFieldJson), testContactField);
  });

  test('ContactField toJson renders contact field correctly', () async {
    expect(jsonDecode(testContactField.toJson()), jsonDecode(testContactFieldJson));
  });

  test('hashcode matches', () async {
    var contactField1 = testContactField;
    var contactField2 = testContactField.copyWith();
    expect(contactField1.hashCode, contactField2.hashCode);
  });

}