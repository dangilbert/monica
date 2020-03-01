
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact/contact_field_type.dart';

void main() {

  var testContactFieldType = ContactFieldType(
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
  );

  var testContactFieldTypeJson = """
    {
      "id": 1,
      "object": "contactfieldtype",
      "name": "Email",
      "fontawesome_icon": "fa fa-envelope-open-o",
      "protocol": "mailto:",
      "delible": false,
      "type": "email",
      "account": { "id": 1 },
      "created_at": "2020-01-19T15:06:17Z",
      "updated_at": "2020-01-19T15:06:17Z"
    }
  """;

test('valid ContactFieldType json decoded correctly', () async {
    expect(ContactFieldType.fromJson(testContactFieldTypeJson), testContactFieldType);
  });

  test('ContactFieldType toJson renders contact field type correctly', () async {
    expect(jsonDecode(testContactFieldType.toJson()), jsonDecode(testContactFieldTypeJson));
  });

  test('hashcode matches', () async {
    var contactFieldType1 = testContactFieldType;
    var contactFieldType2 = testContactFieldType.copyWith();
    expect(contactFieldType1.hashCode, contactFieldType2.hashCode);
  });

}