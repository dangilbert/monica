import 'dart:convert';

import 'package:monica/core/data/model/contact/relationships/relationship.dart';

class Relationships {
  final Relationship love;
  final Relationship family;
  final Relationship friend;
  final Relationship work;
  Relationships({
    this.love,
    this.family,
    this.friend,
    this.work,
  });

  Relationships copyWith({
    Relationship love,
    Relationship family,
    Relationship friend,
    Relationship work,
  }) {
    return Relationships(
      love: love ?? this.love,
      family: family ?? this.family,
      friend: friend ?? this.friend,
      work: work ?? this.work,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'love': love.toMap(),
      'family': family.toMap(),
      'friend': friend.toMap(),
      'work': work.toMap(),
    };
  }

  static Relationships fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Relationships(
      love: Relationship.fromMap(map['love']),
      family: Relationship.fromMap(map['family']),
      friend: Relationship.fromMap(map['friend']),
      work: Relationship.fromMap(map['work']),
    );
  }

  String toJson() => json.encode(toMap());

  static Relationships fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Relationships love: $love, family: $family, friend: $friend, work: $work';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Relationships &&
        o.love == love &&
        o.family == family &&
        o.friend == friend &&
        o.work == work;
  }

  @override
  int get hashCode {
    return love.hashCode ^ family.hashCode ^ friend.hashCode ^ work.hashCode;
  }
}
