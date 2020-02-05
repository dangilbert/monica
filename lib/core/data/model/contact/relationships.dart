import 'dart:convert';

import 'package:monica/core/data/model/contact/relationships/family.dart';
import 'package:monica/core/data/model/contact/relationships/friend.dart';
import 'package:monica/core/data/model/contact/relationships/love.dart';
import 'package:monica/core/data/model/contact/relationships/work.dart';

class Relationships {
  final Love love;
  final Family family;
  final Friend friend;
  final Work work;
  Relationships({
    this.love,
    this.family,
    this.friend,
    this.work,
  });

  Relationships copyWith({
    Love love,
    Family family,
    Friend friend,
    Work work,
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
      love: Love.fromMap(map['love']),
      family: Family.fromMap(map['family']),
      friend: Friend.fromMap(map['friend']),
      work: Work.fromMap(map['work']),
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
