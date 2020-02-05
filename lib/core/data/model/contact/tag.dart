import 'dart:convert';

import 'package:monica/core/data/model/account.dart';

class Tag {
  final int id;
  final String object;
  final String name;
  final String nameSlug;
  final Account account;
  final String createdAt;
  final String updatedAt;
  Tag({
    this.id,
    this.object,
    this.name,
    this.nameSlug,
    this.account,
    this.createdAt,
    this.updatedAt,
  });

  Tag copyWith({
    int id,
    String object,
    String name,
    String nameSlug,
    Account account,
    String createdAt,
    String updatedAt,
  }) {
    return Tag(
      id: id ?? this.id,
      object: object ?? this.object,
      name: name ?? this.name,
      nameSlug: nameSlug ?? this.nameSlug,
      account: account ?? this.account,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'name': name,
      'name_slug': nameSlug,
      'account': account.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static Tag fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Tag(
      id: map['id']?.toInt(),
      object: map['object'],
      name: map['name'],
      nameSlug: map['name_slug'],
      account: Account.fromMap(map['account']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static Tag fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tag id: $id, object: $object, name: $name, name_slug: $nameSlug, account: $account, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Tag &&
        o.id == id &&
        o.object == object &&
        o.name == name &&
        o.nameSlug == nameSlug &&
        o.account == account &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        name.hashCode ^
        nameSlug.hashCode ^
        account.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
