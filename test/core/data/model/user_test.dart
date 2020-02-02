import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/currency.dart';
import 'package:monica/core/data/model/user.dart';

void main() {
  var testUserJson = '''
  {
    "id": 1,
    "object": "user",
    "first_name": "Test",
    "last_name": "User",
    "email": "test@test.com",
    "me_contact": null,
    "timezone": "Europe\/Madrid",
    "currency": {
      "id": 4,
      "object": "currency",
      "iso": "EUR",
      "name": "Euro",
      "symbol": "\u20ac"
    },
    "locale": "en",
    "is_policy_compliant": true,
    "account": {
      "id": 3
    },
    "created_at": "2019-10-06T12:25:31Z",
    "updated_at": "2020-01-25T15:59:01Z"
  }
  ''';

  var testUser = User(
      id: 1,
      object: "user",
      firstName: "Test",
      lastName: "User",
      email: "test@test.com",
      timezone: "Europe/Madrid",
      currency: Currency(
        id: 4,
        object: "currency",
        iso: "EUR",
        name: "Euro",
        symbol: "\u20ac",
      ),
      locale: "en",
      isPolicyCompliant: true,
      account: Account(id: 3),
      createdAt: "2019-10-06T12:25:31Z",
      updatedAt: "2020-01-25T15:59:01Z",
  );

  test('valid user json decoded correctly', () async {
    expect(User.fromJson(testUserJson), testUser);
  });

  test('user toJson renders user correctly', () async {
    expect(jsonDecode(testUser.toJson()), jsonDecode(testUserJson));
  });
}
