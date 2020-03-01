import 'dart:convert';

class MonicaDate {
  bool isAgeBased;
  bool isYearUnknown;
  DateTime date;
  MonicaDate({
    this.isAgeBased,
    this.isYearUnknown,
    this.date,
  });

  MonicaDate copyWith({
    bool isAgeBased,
    bool isYearUnknown,
    DateTime date,
  }) {
    return MonicaDate(
      isAgeBased: isAgeBased ?? this.isAgeBased,
      isYearUnknown: isYearUnknown ?? this.isYearUnknown,
      date: date ?? this.date,
    );
  }

  String _toISO8601DateNoMillis(DateTime dateTime) {
    var isoString = dateTime.toIso8601String();
    return "${isoString.split(".")[0]}Z";
  }

  Map<String, dynamic> toMap() {
    return {
      'is_age_based': isAgeBased,
      'is_year_unknown': isYearUnknown,
      'date': date != null ? _toISO8601DateNoMillis(date) : null
    };
  }

  static MonicaDate fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MonicaDate(
      isAgeBased: map['is_age_based'],
      isYearUnknown: map['is_year_unknown'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  static MonicaDate fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Birthdate isAgeBased: $isAgeBased, isYearUnknown: $isYearUnknown, date: $date';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MonicaDate &&
        o.isAgeBased == isAgeBased &&
        o.isYearUnknown == isYearUnknown &&
        o.date == date;
  }

  @override
  int get hashCode =>
      isAgeBased.hashCode ^ isYearUnknown.hashCode ^ date.hashCode;
}
