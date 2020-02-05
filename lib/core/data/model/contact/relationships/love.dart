import 'dart:convert';

class Love {
  final int total;
  final List<dynamic> contacts;
  Love({
    this.total,
    this.contacts,
  });

  Love copyWith({
    int total,
    List<dynamic> contacts,
  }) {
    return Love(
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

  static Love fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Love(
      total: map['total']?.toInt(),
      contacts: List<dynamic>.from(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  static Love fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Love total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Love && o.total == total && o.contacts == contacts;
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}
