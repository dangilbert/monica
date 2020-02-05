import 'dart:convert';

class Family {
  final int total;
  final List<dynamic> contacts;
  Family({
    this.total,
    this.contacts,
  });

  Family copyWith({
    int total,
    List<dynamic> contacts,
  }) {
    return Family(
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

  static Family fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Family(
      total: map['total']?.toInt(),
      contacts: List<dynamic>.from(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  static Family fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Family total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Family && o.total == total && o.contacts == contacts;
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}
