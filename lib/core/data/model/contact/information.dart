import 'dart:convert';

import 'package:monica/core/data/model/contact/avatar.dart';
import 'package:monica/core/data/model/contact/career.dart';
import 'package:monica/core/data/model/contact/dates.dart';
import 'package:monica/core/data/model/contact/how_you_met.dart';
import 'package:monica/core/data/model/contact/relationships.dart';

class Information {
  final Relationships relationships;
  final Dates dates;
  final Career career;
  final Avatar avatar;
  final String foodPreferences;
  final HowYouMet howYouMet;
  Information({
    this.relationships,
    this.dates,
    this.career,
    this.avatar,
    this.foodPreferences,
    this.howYouMet,
  });

  Information copyWith({
    Relationships relationships,
    Dates dates,
    Career career,
    Avatar avatar,
    String foodPreferences,
    HowYouMet howYouMet,
  }) {
    return Information(
      relationships: relationships ?? this.relationships,
      dates: dates ?? this.dates,
      career: career ?? this.career,
      avatar: avatar ?? this.avatar,
      foodPreferences: foodPreferences ?? this.foodPreferences,
      howYouMet: howYouMet ?? this.howYouMet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'relationships': relationships.toMap(),
      'dates': dates.toMap(),
      'career': career.toMap(),
      'avatar': avatar.toMap(),
      'food_preferences': foodPreferences,
      'how_you_met': howYouMet.toMap(),
    };
  }

  static Information fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Information(
      relationships: Relationships.fromMap(map['relationships']),
      dates: Dates.fromMap(map['dates']),
      career: Career.fromMap(map['career']),
      avatar: Avatar.fromMap(map['avatar']),
      foodPreferences: map['food_preferences'],
      howYouMet: HowYouMet.fromMap(map['how_you_met']),
    );
  }

  String toJson() => json.encode(toMap());

  static Information fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Information relationships: $relationships, dates: $dates, career: $career, avatar: $avatar, food_preferences: $foodPreferences, how_you_met: $howYouMet';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Information &&
        o.relationships == relationships &&
        o.dates == dates &&
        o.career == career &&
        o.avatar == avatar &&
        o.foodPreferences == foodPreferences &&
        o.howYouMet == howYouMet;
  }

  @override
  int get hashCode {
    return relationships.hashCode ^
        dates.hashCode ^
        career.hashCode ^
        avatar.hashCode ^
        foodPreferences.hashCode ^
        howYouMet.hashCode;
  }
}
