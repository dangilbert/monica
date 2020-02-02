import 'dart:convert';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/currency.dart';

import 'contact.dart';

class User {
  int id;
  String object;
  String firstName;
  String lastName;
  String email;
  String timezone;
  Currency currency;
  String locale;
  bool isPolicyCompliant;
  Contact meContact;
  Account account;
  String createdAt;
  String updatedAt;
  User({
    this.id,
    this.object,
    this.firstName,
    this.lastName,
    this.email,
    this.timezone,
    this.currency,
    this.locale,
    this.isPolicyCompliant,
    this.meContact,
    this.account,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    int id,
    String object,
    String firstName,
    String lastName,
    String email,
    String timezone,
    Currency currency,
    String locale,
    bool isPolicyCompliant,
    Contact meContact,
    Account account,
    String createdAt,
    String updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      object: object ?? this.object,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      timezone: timezone ?? this.timezone,
      currency: currency ?? this.currency,
      locale: locale ?? this.locale,
      isPolicyCompliant: isPolicyCompliant ?? this.isPolicyCompliant,
      meContact: meContact ?? this.meContact,
      account: account ?? this.account,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'timezone': timezone,
      'currency': currency.toMap(),
      'locale': locale,
      'is_policy_compliant': isPolicyCompliant,
      'me_contact': meContact,
      'account': account.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      object: map['object'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      email: map['email'],
      timezone: map['timezone'],
      currency: Currency.fromMap(map['currency']),
      locale: map['locale'],
      isPolicyCompliant: map['is_policy_compliant'],
      meContact: null,
      account: Account.fromMap(map['account']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User id: $id, object: $object, first_name: $firstName, last_name: $lastName, email: $email, timezone: $timezone, currency: $currency, locale: $locale, is_policy_compliant: $isPolicyCompliant, me_contact: $meContact, account: $account, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.id == id &&
        o.object == object &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.email == email &&
        o.timezone == timezone &&
        o.currency == currency &&
        o.locale == locale &&
        o.isPolicyCompliant == isPolicyCompliant &&
        o.meContact == meContact &&
        o.account == account &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        timezone.hashCode ^
        currency.hashCode ^
        locale.hashCode ^
        isPolicyCompliant.hashCode ^
        meContact.hashCode ^
        account.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
