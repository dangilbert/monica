import 'dart:convert';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact.dart';

class Note {
  final int id;
  final String object;
  final String body;
  final bool isFavorited;
  final String favoritedAt;
  final String url;
  final Account account;
  final Contact contact;
  final String createdAt;
  final String updatedAt;
  Note({
    this.id,
    this.object,
    this.body,
    this.isFavorited,
    this.favoritedAt,
    this.url,
    this.account,
    this.contact,
    this.createdAt,
    this.updatedAt,
  });

  Note copyWith({
    int id,
    String object,
    String body,
    bool isFavorited,
    String favoritedAt,
    String url,
    Account account,
    Contact contact,
    String createdAt,
    String updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      object: object ?? this.object,
      body: body ?? this.body,
      isFavorited: isFavorited ?? this.isFavorited,
      favoritedAt: favoritedAt ?? this.favoritedAt,
      url: url ?? this.url,
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
      'body': body,
      'is_favorited': isFavorited,
      'favorited_at': favoritedAt,
      'url': url,
      'account': account.toMap(),
      'contact': contact.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static Note fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Note(
      id: map['id']?.toInt(),
      object: map['object'],
      body: map['body'],
      isFavorited: map['is_favorited'],
      favoritedAt: map['favorited_at'],
      url: map['url'],
      account: Account.fromMap(map['account']),
      contact: Contact.fromMap(map['contact']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static Note fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Note id: $id, object: $object, body: $body, is_favorited: $isFavorited, favorited_at: $favoritedAt, url: $url, account: $account, contact: $contact, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Note &&
        o.id == id &&
        o.object == object &&
        o.body == body &&
        o.isFavorited == isFavorited &&
        o.favoritedAt == favoritedAt &&
        o.url == url &&
        o.account == account &&
        o.contact == contact &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        body.hashCode ^
        isFavorited.hashCode ^
        favoritedAt.hashCode ^
        url.hashCode ^
        account.hashCode ^
        contact.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
