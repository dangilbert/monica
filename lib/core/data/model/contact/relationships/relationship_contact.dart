import 'dart:convert';

import 'package:monica/core/data/model/contact.dart';

class RelationshipContact {
  final ContactRelationship relationship;
  final Contact contact;
  RelationshipContact({
    this.relationship,
    this.contact,
  });

  RelationshipContact copyWith({
    ContactRelationship relationship,
    Contact contact,
  }) {
    return RelationshipContact(
      relationship: relationship ?? this.relationship,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'relationship': relationship.toMap(),
      'contact': contact.toMap(),
    };
  }

  static RelationshipContact fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RelationshipContact(
      relationship: ContactRelationship.fromMap(map['relationship']),
      contact: Contact.fromMap(map['contact']),
    );
  }

  String toJson() => json.encode(toMap());

  static RelationshipContact fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'RelationshipContact(relationship: $relationship, contact: $contact)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RelationshipContact &&
        o.relationship == relationship &&
        o.contact == contact;
  }

  @override
  int get hashCode => relationship.hashCode ^ contact.hashCode;
}

class ContactRelationship {
  final int id;
  final String name;
  ContactRelationship({
    this.id,
    this.name,
  });

  ContactRelationship copyWith({
    int id,
    String name,
  }) {
    return ContactRelationship(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static ContactRelationship fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ContactRelationship(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  static ContactRelationship fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() => 'ContactRelationship(id: $id, name: $name)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ContactRelationship && o.id == id && o.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
