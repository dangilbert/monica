import 'dart:convert';

import 'package:monica/core/data/model/contact/avatar.dart';
import 'package:monica/core/data/model/contact/career.dart';
import 'package:monica/core/data/model/contact/dates.dart';
import 'package:monica/core/data/model/contact/how_you_met.dart';

class Information {
  // Relationships relationships;
  Dates dates;
  Career career;
  Avatar avatar;
  String foodPreferencies;
  HowYouMet howYouMet;
  Information({
    // this.relationships,
    this.dates,
    this.career,
    this.avatar,
    this.foodPreferencies,
    this.howYouMet,
  });

  Information copyWith({
    // Relationships relationships,
    Dates dates,
    Career career,
    Avatar avatar,
    String foodPreferencies,
    HowYouMet howYouMet,
  }) {
    return Information(
      // relationships: relationships ?? this.relationships,
      dates: dates ?? this.dates,
      career: career ?? this.career,
      avatar: avatar ?? this.avatar,
      foodPreferencies: foodPreferencies ?? this.foodPreferencies,
      howYouMet: howYouMet ?? this.howYouMet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'relationships': relationships.toMap(),
      'dates': dates.toMap(),
      'career': career.toMap(),
      'avatar': avatar.toMap(),
      'food_preferencies': foodPreferencies,
      'how_you_met': howYouMet.toMap(),
    };
  }

  static Information fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Information(
      // relationships: // Relationships.fromMap(map['relationships']),
      dates: Dates.fromMap(map['dates']),
      career: Career.fromMap(map['career']),
      avatar: Avatar.fromMap(map['avatar']),
      foodPreferencies: map['food_preferencies'],
      howYouMet: HowYouMet.fromMap(map['how_you_met']),
    );
  }

  String toJson() => json.encode(toMap());

  static Information fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Information dates: $dates, career: $career, avatar: $avatar, foodPreferencies: $foodPreferencies, howYouMet: $howYouMet';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Information &&
        // o.relationships == relationships &&
        o.dates == dates &&
        o.career == career &&
        o.avatar == avatar &&
        o.foodPreferencies == foodPreferencies &&
        o.howYouMet == howYouMet;
  }

  @override
  int get hashCode {
    // return relationships.hashCode ^
    return dates.hashCode ^
        career.hashCode ^
        avatar.hashCode ^
        foodPreferencies.hashCode ^
        howYouMet.hashCode;
  }
}