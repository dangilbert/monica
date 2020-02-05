import 'dart:convert';

class Country {
  final String id;
  final String object;
  final String name;
  final String iso;
  Country({
    this.id,
    this.object,
    this.name,
    this.iso,
  });

  Country copyWith({
    String id,
    String object,
    String name,
    String iso,
  }) {
    return Country(
      id: id ?? this.id,
      object: object ?? this.object,
      name: name ?? this.name,
      iso: iso ?? this.iso,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'name': name,
      'iso': iso,
    };
  }

  static Country fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Country(
      id: map['id'],
      object: map['object'],
      name: map['name'],
      iso: map['iso'],
    );
  }

  String toJson() => json.encode(toMap());

  static Country fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country id: $id, object: $object, name: $name, iso: $iso';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Country &&
        o.id == id &&
        o.object == object &&
        o.name == name &&
        o.iso == iso;
  }

  @override
  int get hashCode {
    return id.hashCode ^ object.hashCode ^ name.hashCode ^ iso.hashCode;
  }
}
