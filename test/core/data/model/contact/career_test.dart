
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/contact/career.dart';

void main() {

  var testCareer = Career(
    job: "QA Tester",
    company: "Monica HQ"
  );

  var testCareerJson = """
    {
      "job": "QA Tester",
      "company": "Monica HQ"
    }
  """;

test('valid career json decoded correctly', () async {
    expect(Career.fromJson(testCareerJson), testCareer);
  });

  test('career toJson renders career correctly', () async {
    expect(jsonDecode(testCareer.toJson()), jsonDecode(testCareerJson));
  });

  test('hashcode matches', () async {
    var career1 = testCareer;
    var career2 = testCareer.copyWith();
    expect(career1.hashCode, career2.hashCode);
  });

}