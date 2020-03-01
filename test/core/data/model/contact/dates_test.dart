
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/contact/dates.dart';
import 'package:monica/core/data/model/contact/monica_date.dart';

void main() {

  var testDates = Dates(
    birthdate: MonicaDate(
      isAgeBased: true,
      isYearUnknown: false,
      date: DateTime.parse("2003-01-01T00:00:00Z")
    ),
    deceasedDate: MonicaDate(
      isAgeBased: false,
      isYearUnknown: true,
      date: DateTime.parse("1970-01-01T00:00:00Z")

    )
  );

  var testDatesJson = """
    {
      "birthdate": {
        "is_age_based": true,
        "is_year_unknown": false,
        "date": "2003-01-01T00:00:00Z"
      },
      "deceased_date": {
        "is_age_based": false,
        "is_year_unknown": true,
        "date": "1970-01-01T00:00:00Z"
      }
    }
  """;

test('valid dates json decoded correctly', () async {
    expect(Dates.fromJson(testDatesJson), testDates);
  });

  test('dates toJson renders dates correctly', () async {
    expect(jsonDecode(testDates.toJson()), jsonDecode(testDatesJson));
  });

  test('hashcode matches', () async {
    var dates1 = testDates;
    var dates2 = testDates.copyWith();
    expect(dates1.hashCode, dates2.hashCode);
  });

}