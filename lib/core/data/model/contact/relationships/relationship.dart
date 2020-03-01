import 'dart:convert';
import 'package:collection/collection.dart';

class Relationship {
  final int total;
  final List<dynamic> contacts;
  Relationship({
    this.total,
    this.contacts,
  });

  Relationship copyWith({
    int total,
    List<dynamic> contacts,
  }) {
    return Relationship(
      total: total ?? this.total,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'contacts': List<dynamic>.from(contacts.map((x) => x)),
    };
  }

  static Relationship fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Relationship(
      total: map['total']?.toInt(),
      contacts: List<dynamic>.from(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  static Relationship fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Relationship total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Relationship &&
        o.total == total &&
        ListEquality().equals(o.contacts, contacts);
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}
