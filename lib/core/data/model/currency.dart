import 'dart:convert';

class Currency {
  int id;
  String object;
  String iso;
  String name;
  String symbol;
  Currency({
    this.id,
    this.object,
    this.iso,
    this.name,
    this.symbol,
  });

  Currency copyWith({
    int id,
    String object,
    String iso,
    String name,
    String symbol,
  }) {
    return Currency(
      id: id ?? this.id,
      object: object ?? this.object,
      iso: iso ?? this.iso,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'iso': iso,
      'name': name,
      'symbol': symbol,
    };
  }

  static Currency fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Currency(
      id: map['id'],
      object: map['object'],
      iso: map['iso'],
      name: map['name'],
      symbol: map['symbol'],
    );
  }

  String toJson() => json.encode(toMap());

  static Currency fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Currency id: $id, object: $object, iso: $iso, name: $name, symbol: $symbol';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Currency &&
        o.id == id &&
        o.object == object &&
        o.iso == iso &&
        o.name == name &&
        o.symbol == symbol;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        iso.hashCode ^
        name.hashCode ^
        symbol.hashCode;
  }
}
