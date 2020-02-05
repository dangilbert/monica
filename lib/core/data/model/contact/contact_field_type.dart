import 'dart:convert';

import 'package:monica/core/data/model/account.dart';

class ContactFieldType {
  final int id;
  final String object;
  final String name;
  final String fontawesomeIcon;
  final String protocol;
  final bool delible;
  final String type;
  final Account account;
  final String createdAt;
  final String updatedAt;
  ContactFieldType({
    this.id,
    this.object,
    this.name,
    this.fontawesomeIcon,
    this.protocol,
    this.delible,
    this.type,
    this.account,
    this.createdAt,
    this.updatedAt,
  });

  ContactFieldType copyWith({
    int id,
    String object,
    String name,
    String fontawesomeIcon,
    String protocol,
    bool delible,
    String type,
    Account account,
    String createdAt,
    String updatedAt,
  }) {
    return ContactFieldType(
      id: id ?? this.id,
      object: object ?? this.object,
      name: name ?? this.name,
      fontawesomeIcon: fontawesomeIcon ?? this.fontawesomeIcon,
      protocol: protocol ?? this.protocol,
      delible: delible ?? this.delible,
      type: type ?? this.type,
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
      'fontawesome_icon': fontawesomeIcon,
      'protocol': protocol,
      'delible': delible,
      'type': type,
      'account': account.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static ContactFieldType fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactFieldType(
      id: map['id']?.toInt(),
      object: map['object'],
      name: map['name'],
      fontawesomeIcon: map['fontawesome_icon'],
      protocol: map['protocol'],
      delible: map['delible'],
      type: map['type'],
      account: Account.fromMap(map['account']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static ContactFieldType fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact_field_type id: $id, object: $object, name: $name, fontawesome_icon: $fontawesomeIcon, protocol: $protocol, delible: $delible, type: $type, account: $account, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContactFieldType &&
        o.id == id &&
        o.object == object &&
        o.name == name &&
        o.fontawesomeIcon == fontawesomeIcon &&
        o.protocol == protocol &&
        o.delible == delible &&
        o.type == type &&
        o.account == account &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        name.hashCode ^
        fontawesomeIcon.hashCode ^
        protocol.hashCode ^
        delible.hashCode ^
        type.hashCode ^
        account.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
