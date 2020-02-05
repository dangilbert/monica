import 'dart:convert';

import 'package:monica/core/data/model/contact/monica_date.dart';

class Dates {
  final MonicaDate birthdate;
  final MonicaDate deceasedDate;
  Dates({
    this.birthdate,
    this.deceasedDate,
  });

  Dates copyWith({
    MonicaDate birthdate,
    MonicaDate deceasedDate,
  }) {
    return Dates(
      birthdate: birthdate ?? this.birthdate,
      deceasedDate: deceasedDate ?? this.deceasedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'birthdate': birthdate.toMap(),
      'deceased_date': deceasedDate.toMap(),
    };
  }

  static Dates fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dates(
      birthdate: MonicaDate.fromMap(map['birthdate']),
      deceasedDate: MonicaDate.fromMap(map['deceased_date']),
    );
  }

  String toJson() => json.encode(toMap());

  static Dates fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Dates birthdate: $birthdate, deceased_date: $deceasedDate';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Dates &&
        o.birthdate == birthdate &&
        o.deceasedDate == deceasedDate;
  }

  @override
  int get hashCode => birthdate.hashCode ^ deceasedDate.hashCode;
}
