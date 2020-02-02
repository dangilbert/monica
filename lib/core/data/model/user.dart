import 'dart:convert';

import 'contact.dart';

class User {
  Data data;
  User({
    this.data,
  });

  User copyWith({
    Data data,
  }) {
    return User(
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      data: Data.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'User data: $data';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is User &&
      o.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

class Data {
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
  Data({
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

  Data copyWith({
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
    String updated_at,
  }) {
    return Data(
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
      updatedAt: updated_at ?? this.updatedAt,
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

  static Data fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Data(
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

  static Data fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data id: $id, object: $object, first_name: $firstName, last_name: $lastName, email: $email, timezone: $timezone, currency: $currency, locale: $locale, is_policy_compliant: $isPolicyCompliant, me_contact: $meContact, account: $account, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Data &&
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

class Account {
  int id;
  Account({
    this.id,
  });

  Account copyWith({
    int id,
  }) {
    return Account(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  static Account fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Account(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  static Account fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Account id: $id';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Account &&
      o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
