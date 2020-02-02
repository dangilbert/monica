import 'dart:convert';

import 'package:monica/core/data/model/contact/birthdate.dart';

class Dates {
  Birthdate birthdate;
  Birthdate deceasedDate;
  Dates({
    this.birthdate,
    this.deceasedDate,
  });

  Dates copyWith({
    Birthdate birthdate,
    Birthdate deceasedDate,
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
      birthdate: Birthdate.fromMap(map['birthdate']),
      deceasedDate: Birthdate.fromMap(map['deceased_date']),
    );
  }

  String toJson() => json.encode(toMap());

  static Dates fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Dates birthdate: $birthdate, deceasedDate: $deceasedDate';

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
