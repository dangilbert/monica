import 'dart:convert';

class Birthdate {
  bool isAgeBased;
  bool isYearUnknown;
  DateTime date;
  Birthdate({
    this.isAgeBased,
    this.isYearUnknown,
    this.date,
  });

  Birthdate copyWith({
    bool isAgeBased,
    bool isYearUnknown,
    DateTime date,
  }) {
    return Birthdate(
      isAgeBased: isAgeBased ?? this.isAgeBased,
      isYearUnknown: isYearUnknown ?? this.isYearUnknown,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_age_based': isAgeBased,
      'is_year_unknown': isYearUnknown,
      'date': date.millisecondsSinceEpoch,
    };
  }

  static Birthdate fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Birthdate(
      isAgeBased: map['is_age_based'],
      isYearUnknown: map['is_year_unknown'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  static Birthdate fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Birthdate isAgeBased: $isAgeBased, isYearUnknown: $isYearUnknown, date: $date';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Birthdate &&
        o.isAgeBased == isAgeBased &&
        o.isYearUnknown == isYearUnknown &&
        o.date == date;
  }

  @override
  int get hashCode =>
      isAgeBased.hashCode ^ isYearUnknown.hashCode ^ date.hashCode;
}
