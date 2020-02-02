import 'dart:convert';

class LastActivityTogether {
  String date;
  int timezoneType;
  String timezone;
  LastActivityTogether({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  LastActivityTogether copyWith({
    String date,
    int timezoneType,
    String timezone,
  }) {
    return LastActivityTogether(
      date: date ?? this.date,
      timezoneType: timezoneType ?? this.timezoneType,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'timezone_type': timezoneType,
      'timezone': timezone,
    };
  }

  static LastActivityTogether fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LastActivityTogether(
      date: map['date'],
      timezoneType: map['timezone_type'],
      timezone: map['timezone'],
    );
  }

  String toJson() => json.encode(toMap());

  static LastActivityTogether fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'LastActivityTogether date: $date, timezoneType: $timezoneType, timezone: $timezone';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LastActivityTogether &&
        o.date == date &&
        o.timezoneType == timezoneType &&
        o.timezone == timezone;
  }

  @override
  int get hashCode => date.hashCode ^ timezoneType.hashCode ^ timezone.hashCode;
}
