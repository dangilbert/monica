import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/currency.dart';

void main() {
  var testCurrency = Currency(
    id: 4,
    object: "currency",
    iso: "EUR",
    name: "Euro",
    symbol: "\u20ac",
  );

  var testCurrencyJson = '''
  {
      "id": 4,
      "object": "currency",
      "iso": "EUR",
      "name": "Euro",
      "symbol": "\u20ac"
    }
  ''';

  var testCurrencyString =
      "Currency id: 4, object: currency, iso: EUR, name: Euro, symbol: \u20ac";

  test('valid currency json decoded correctly', () async {
    expect(Currency.fromJson(testCurrencyJson), testCurrency);
  });

  test('user toJson renders user correctly', () async {
    expect(jsonDecode(testCurrency.toJson()), jsonDecode(testCurrencyJson));
  });

  test('hashcode matches', () async {
    var currency1 = testCurrency;
    var currency2 = testCurrency.copyWith();
    expect(currency1.hashCode, currency2.hashCode);
  });

  test('toString is valid', () async {
    expect(testCurrency.toString(), testCurrencyString);
  });
}
