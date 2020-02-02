import 'dart:convert';

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });


  Meta copyWith({
    int currentPage,
    int from,
    int lastPage,
    String path,
    int perPage,
    int to,
    int total,
  }) {
    return Meta(
      currentPage: currentPage ?? this.currentPage,
      from: from ?? this.from,
      lastPage: lastPage ?? this.lastPage,
      path: path ?? this.path,
      perPage: perPage ?? this.perPage,
      to: to ?? this.to,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_page': currentPage,
      'from': from,
      'last_page': lastPage,
      'path': path,
      'per_page': perPage,
      'to': to,
      'total': total,
    };
  }

  static Meta fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Meta(
      currentPage: map['current_page'],
      from: map['from'],
      lastPage: map['last_page'],
      path: map['path'],
      perPage: int.parse(map['per_page']),
      to: map['to'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  static Meta fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meta currentPage: $currentPage, from: $from, lastPage: $lastPage, path: $path, perPage: $perPage, to: $to, total: $total';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Meta &&
      o.currentPage == currentPage &&
      o.from == from &&
      o.lastPage == lastPage &&
      o.path == path &&
      o.perPage == perPage &&
      o.to == to &&
      o.total == total;
  }

  @override
  int get hashCode {
    return currentPage.hashCode ^
      from.hashCode ^
      lastPage.hashCode ^
      path.hashCode ^
      perPage.hashCode ^
      to.hashCode ^
      total.hashCode;
  }
}
