import 'dart:convert';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/contact/contact_field_type.dart';

class ContactField {
  final int id;
  final String object;
  final String content;
  final ContactFieldType contactFieldType;
  final Account account;
  final Contact contact;
  final String createdAt;
  final String updatedAt;
  ContactField({
    this.id,
    this.object,
    this.content,
    this.contactFieldType,
    this.account,
    this.contact,
    this.createdAt,
    this.updatedAt,
  });

  ContactField copyWith({
    int id,
    String object,
    String content,
    ContactFieldType contactFieldType,
    Account account,
    Contact contact,
    String createdAt,
    String updatedAt,
  }) {
    return ContactField(
      id: id ?? this.id,
      object: object ?? this.object,
      content: content ?? this.content,
      contactFieldType: contactFieldType ?? this.contactFieldType,
      account: account ?? this.account,
      contact: contact ?? this.contact,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'content': content,
      'contact_field_type': contactFieldType.toMap(),
      'account': account.toMap(),
      'contact': contact.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static ContactField fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactField(
      id: map['id']?.toInt(),
      object: map['object'],
      content: map['content'],
      contactFieldType: ContactFieldType.fromMap(map['contact_field_type']),
      account: Account.fromMap(map['account']),
      contact: Contact.fromMap(map['contact']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static ContactField fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'ContactField id: $id, object: $object, content: $content, contact_field_type: $contactFieldType, account: $account, contact: $contact, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContactField &&
        o.id == id &&
        o.object == object &&
        o.content == content &&
        o.contactFieldType == contactFieldType &&
        o.account == account &&
        o.contact == contact &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        content.hashCode ^
        contactFieldType.hashCode ^
        account.hashCode ^
        contact.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
