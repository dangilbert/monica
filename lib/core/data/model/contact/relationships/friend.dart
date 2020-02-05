import 'dart:convert';

class Friend {
  final int total;
  final List<dynamic> contacts;
  Friend({
    this.total,
    this.contacts,
  });

  Friend copyWith({
    int total,
    List<dynamic> contacts,
  }) {
    return Friend(
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

  static Friend fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Friend(
      total: map['total']?.toInt(),
      contacts: List<dynamic>.from(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  static Friend fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Friend total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Friend && o.total == total && o.contacts == contacts;
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}
