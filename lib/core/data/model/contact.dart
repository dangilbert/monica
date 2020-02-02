import 'dart:convert';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact/information.dart';
import 'package:monica/core/data/model/contact/last_activity_together.dart';
import 'package:monica/core/data/model/contact/statistics.dart';

class Contact {
  int id;
  String object;
  String firstName;
  String lastName;
  String nickname;
  String gender;
  bool isPartial;
  bool isDead;
  Null lastCalled;
  LastActivityTogether lastActivityTogether;
  int stayInTouchFrequency;
  String stayInTouchTriggerDate;
  Information information;
  List<Null> addresses;
  List<Null> tags;
  Statistics statistics;
  Account account;
  String createdAt;
  String updatedAt;
  Contact({
    this.id,
    this.object,
    this.firstName,
    this.lastName,
    this.nickname,
    this.gender,
    this.isPartial,
    this.isDead,
    this.lastCalled,
    this.lastActivityTogether,
    this.stayInTouchFrequency,
    this.stayInTouchTriggerDate,
    this.information,
    this.addresses,
    this.tags,
    this.statistics,
    this.account,
    this.createdAt,
    this.updatedAt,
  });

  get initials {
    var firstInitial = firstName.substring(0, 1);
    var secondInitial =
        lastName != null && lastName.length > 0 ? lastName.substring(0, 1) : "";
    return "$firstInitial$secondInitial";
  }

  factory Contact.fromJsonString(String jsonString) {
    return fromJson(jsonString);
  }

  Contact copyWith({
    int id,
    String object,
    String firstName,
    String lastName,
    String nickname,
    String gender,
    bool isPartial,
    bool isDead,
    Null lastCalled,
    LastActivityTogether lastActivityTogether,
    int stayInTouchFrequency,
    String stayInTouchTriggerDate,
    Information information,
    List<Null> addresses,
    List<Null> tags,
    Statistics statistics,
    Account account,
    String createdAt,
    String updatedAt,
  }) {
    return Contact(
      id: id ?? this.id,
      object: object ?? this.object,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      isPartial: isPartial ?? this.isPartial,
      isDead: isDead ?? this.isDead,
      lastCalled: lastCalled ?? this.lastCalled,
      lastActivityTogether: lastActivityTogether ?? this.lastActivityTogether,
      stayInTouchFrequency: stayInTouchFrequency ?? this.stayInTouchFrequency,
      stayInTouchTriggerDate:
          stayInTouchTriggerDate ?? this.stayInTouchTriggerDate,
      information: information ?? this.information,
      addresses: addresses ?? this.addresses,
      tags: tags ?? this.tags,
      statistics: statistics ?? this.statistics,
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
      'nickname': nickname,
      'gender': gender,
      'is_partial': isPartial,
      'is_dead': isDead,
      // 'lastCalled': lastCalled,
      'last_activity_together': lastActivityTogether.toMap(),
      'stay_in_touch_frequency': stayInTouchFrequency,
      'stay_in_touch_trigger_date': stayInTouchTriggerDate,
      'information': information.toMap(),
      // 'addresses': addresses,
      // 'tags': tags,
      'statistics': statistics.toMap(),
      'account': account.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Contact(
      id: map['id'],
      object: map['object'],
      firstName: map['first_name'],
      lastName: map['last_name'] ?? "",
      nickname: map['nickname'],
      gender: map['gender'],
      isPartial: map['is_partial'],
      isDead: map['is_dead'],
      // lastCalled: map['lastCalled'],
      lastActivityTogether:
          LastActivityTogether.fromMap(map['last_activity_together']),
      stayInTouchFrequency: map['stay_in_touch_frequency'],
      stayInTouchTriggerDate: map['stay_in_touch_triggerDate'],
      information: Information.fromMap(map['information']),
      // addresses: List<Null>.from(map['addresses']?.map((x) => Null.fromMap(x))),
      // tags: List<Null>.from(map['tags']?.map((x) => Null.fromMap(x))),
      statistics: Statistics.fromMap(map['statistics']),
      account: Account.fromMap(map['account']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static Contact fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact id: $id, object: $object, firstName: $firstName, lastName: $lastName, nickname: $nickname, gender: $gender, isPartial: $isPartial, isDead: $isDead, lastCalled: $lastCalled, lastActivityTogether: $lastActivityTogether, stayInTouchFrequency: $stayInTouchFrequency, stayInTouchTriggerDate: $stayInTouchTriggerDate, information: $information, addresses: $addresses, tags: $tags, statistics: $statistics, account: $account, createdAt: $createdAt, updatedAt: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Contact &&
        o.id == id &&
        o.object == object &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.nickname == nickname &&
        o.gender == gender &&
        o.isPartial == isPartial &&
        o.isDead == isDead &&
        o.lastCalled == lastCalled &&
        o.lastActivityTogether == lastActivityTogether &&
        o.stayInTouchFrequency == stayInTouchFrequency &&
        o.stayInTouchTriggerDate == stayInTouchTriggerDate &&
        o.information == information &&
        o.addresses == addresses &&
        o.tags == tags &&
        o.statistics == statistics &&
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
        nickname.hashCode ^
        gender.hashCode ^
        isPartial.hashCode ^
        isDead.hashCode ^
        lastCalled.hashCode ^
        lastActivityTogether.hashCode ^
        stayInTouchFrequency.hashCode ^
        stayInTouchTriggerDate.hashCode ^
        information.hashCode ^
        addresses.hashCode ^
        tags.hashCode ^
        statistics.hashCode ^
        account.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
