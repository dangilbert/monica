import 'dart:convert';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/contact/address/country.dart';

class Address {
  final int id;
  final String object;
  final String name;
  final String street;
  final String city;
  final String province;
  final String postalCode;
  final int latitude;
  final int longitude;
  final Country country;
  final String url;
  final Account account;
  final Contact contact;
  final String createdAt;
  final String updatedAt;
  Address({
    this.id,
    this.object,
    this.name,
    this.street,
    this.city,
    this.province,
    this.postalCode,
    this.latitude,
    this.longitude,
    this.country,
    this.url,
    this.account,
    this.contact,
    this.createdAt,
    this.updatedAt,
  });

  Address copyWith({
    int id,
    String object,
    String name,
    String street,
    String city,
    String province,
    String postalCode,
    int latitude,
    int longitude,
    Country country,
    String url,
    Account account,
    Contact contact,
    String createdAt,
    String updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      object: object ?? this.object,
      name: name ?? this.name,
      street: street ?? this.street,
      city: city ?? this.city,
      province: province ?? this.province,
      postalCode: postalCode ?? this.postalCode,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      country: country ?? this.country,
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
      'name': name,
      'street': street,
      'city': city,
      'province': province,
      'postal_code': postalCode,
      'latitude': latitude,
      'longitude': longitude,
      'country': country.toMap(),
      'url': url,
      'account': account.toMap(),
      'contact': contact.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static Address fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Address(
      id: map['id']?.toInt(),
      object: map['object'],
      name: map['name'],
      street: map['street'],
      city: map['city'],
      province: map['province'],
      postalCode: map['postal_code'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      country: Country.fromMap(map['country']),
      url: map['url'],
      account: Account.fromMap(map['account']),
      contact: Contact.fromMap(map['contact']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static Address fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Addresse id: $id, object: $object, name: $name, street: $street, city: $city, province: $province, postal_code: $postalCode, latitude: $latitude, longitude: $longitude, country: $country, url: $url, account: $account, contact: $contact, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Address &&
        o.id == id &&
        o.object == object &&
        o.name == name &&
        o.street == street &&
        o.city == city &&
        o.province == province &&
        o.postalCode == postalCode &&
        o.latitude == latitude &&
        o.longitude == longitude &&
        o.country == country &&
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
        name.hashCode ^
        street.hashCode ^
        city.hashCode ^
        province.hashCode ^
        postalCode.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        country.hashCode ^
        url.hashCode ^
        account.hashCode ^
        contact.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
