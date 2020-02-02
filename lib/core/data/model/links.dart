import 'dart:convert';

class Links {
  String first;
  String last;
  String prev;
  String next;
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  Links copyWith({
    String first,
    String last,
    String prev,
    String next,
  }) {
    return Links(
      first: first ?? this.first,
      last: last ?? this.last,
      prev: prev ?? this.prev,
      next: next ?? this.next,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first': first,
      'last': last,
      'prev': prev,
      'next': next,
    };
  }

  static Links fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Links(
      first: map['first'],
      last: map['last'],
      prev: map['prev'],
      next: map['next'],
    );
  }

  String toJson() => json.encode(toMap());

  static Links fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Links first: $first, last: $last, prev: $prev, next: $next';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Links &&
        o.first == first &&
        o.last == last &&
        o.prev == prev &&
        o.next == next;
  }

  @override
  int get hashCode {
    return first.hashCode ^ last.hashCode ^ prev.hashCode ^ next.hashCode;
  }
}
