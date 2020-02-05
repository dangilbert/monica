import 'dart:convert';

class Work {
  final int total;
  final List<dynamic> contacts;
  Work({
    this.total,
    this.contacts,
  });

  Work copyWith({
    int total,
    List<dynamic> contacts,
  }) {
    return Work(
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

  static Work fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Work(
      total: map['total']?.toInt(),
      contacts: List<dynamic>.from(map['contacts']),
    );
  }

  String toJson() => json.encode(toMap());

  static Work fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Work total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Work && o.total == total && o.contacts == contacts;
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}
