import 'dart:convert';
import 'package:collection/collection.dart';

import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact/address/address.dart';
import 'package:monica/core/data/model/contact/contact_fields.dart';
import 'package:monica/core/data/model/contact/information.dart';
import 'package:monica/core/data/model/contact/note.dart';
import 'package:monica/core/data/model/contact/statistics.dart';
import 'package:monica/core/data/model/contact/tag.dart';

class Contact {
  final int id;
  final String object;
  final String hashId;
  final String firstName;
  final String lastName;
  final String nickname;
  final String gender;
  final String genderType;
  final bool isStarred;
  final bool isPartial;
  final bool isActive;
  final bool isDead;
  final bool isMe;
  final String lastCalled;
  final String lastActivityTogether;
  final int stayInTouchFrequency;
  final String stayInTouchTriggerDate;
  final Information information;
  final List<Address> addresses;
  final List<Tag> tags;
  final Statistics statistics;
  final List<ContactField> contactFields;
  final List<Note> notes;
  final String url;
  final Account account;
  final String createdAt;
  final String updatedAt;
  Contact({
    this.id,
    this.object,
    this.hashId,
    this.firstName,
    this.lastName,
    this.nickname,
    this.gender,
    this.genderType,
    this.isStarred,
    this.isPartial,
    this.isActive,
    this.isDead,
    this.isMe,
    this.lastCalled,
    this.lastActivityTogether,
    this.stayInTouchFrequency,
    this.stayInTouchTriggerDate,
    this.information,
    this.addresses,
    this.tags,
    this.statistics,
    this.contactFields,
    this.notes,
    this.url,
    this.account,
    this.createdAt,
    this.updatedAt,
  });

  Contact copyWith({
    int id,
    String object,
    String hashId,
    String firstName,
    String lastName,
    String nickname,
    String gender,
    String genderType,
    bool isStarred,
    bool isPartial,
    bool isActive,
    bool isDead,
    bool isMe,
    String lastCalled,
    String lastActivityTogether,
    int stayInTouchFrequency,
    String stayInTouchTriggerDate,
    Information information,
    List<Address> addresses,
    List<Tag> tags,
    Statistics statistics,
    List<ContactField> contactFields,
    List<Note> notes,
    String url,
    Account account,
    String createdAt,
    String updatedAt,
  }) {
    return Contact(
      id: id ?? this.id,
      object: object ?? this.object,
      hashId: hashId ?? this.hashId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName ?? "",
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      genderType: genderType ?? this.genderType,
      isStarred: isStarred ?? this.isStarred,
      isPartial: isPartial ?? this.isPartial,
      isActive: isActive ?? this.isActive,
      isDead: isDead ?? this.isDead,
      isMe: isMe ?? this.isMe,
      lastCalled: lastCalled ?? this.lastCalled,
      lastActivityTogether: lastActivityTogether ?? this.lastActivityTogether,
      stayInTouchFrequency: stayInTouchFrequency ?? this.stayInTouchFrequency,
      stayInTouchTriggerDate:
          stayInTouchTriggerDate ?? this.stayInTouchTriggerDate,
      information: information ?? this.information,
      addresses: addresses ?? this.addresses,
      tags: tags ?? this.tags,
      statistics: statistics ?? this.statistics,
      contactFields: contactFields ?? this.contactFields,
      notes: notes ?? this.notes,
      url: url ?? this.url,
      account: account ?? this.account,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'hash_id': hashId,
      'first_name': firstName,
      'last_name': lastName,
      'nickname': nickname,
      'gender': gender,
      'gender_type': genderType,
      'is_starred': isStarred,
      'is_partial': isPartial,
      'is_active': isActive,
      'is_dead': isDead,
      'is_me': isMe,
      'last_called': lastCalled,
      'last_activity_together': lastActivityTogether,
      'stay_in_touch_frequency': stayInTouchFrequency,
      'stay_in_touch_trigger_date': stayInTouchTriggerDate,
      'information': information.toMap(),
      'addresses': List<dynamic>.from(addresses.map((x) => x.toMap())),
      'tags': List<dynamic>.from(tags.map((x) => x.toMap())),
      'statistics': statistics.toMap(),
      'contactFields': List<dynamic>.from(contactFields.map((x) => x.toMap())),
      'notes': List<dynamic>.from(notes.map((x) => x.toMap())),
      'url': url,
      'account': account.toMap(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Contact(
      id: map['id']?.toInt(),
      object: map['object'],
      hashId: map['hash_id'],
      firstName: map['first_name'],
      lastName: map['last_name'] ?? "",
      nickname: map['nickname'],
      gender: map['gender'],
      genderType: map['gender_type'],
      isStarred: map['is_starred'],
      isPartial: map['is_partial'],
      isActive: map['is_active'],
      isDead: map['is_dead'],
      isMe: map['is_me'],
      lastCalled: map['last_called'],
      lastActivityTogether: map['last_activity_together'],
      stayInTouchFrequency: map['stay_in_touch_frequency']?.toInt(),
      stayInTouchTriggerDate: map['stay_in_touch_trigger_date'],
      information: Information.fromMap(map['information']),
      addresses: map['addresses'] != null
          ? List<Address>.from(map['addresses']?.map((x) => Address.fromMap(x)))
          : [],
      tags: map['tags'] != null
          ? List<Tag>.from(map['tags']?.map((x) => Tag.fromMap(x)))
          : [],
      statistics: Statistics.fromMap(map['statistics']),
      contactFields: map['contactFields'] != null
          ? List<ContactField>.from(
              map['contactFields']?.map((x) => ContactField.fromMap(x)))
          : [],
      notes: map['notes'] != null
          ? List<Note>.from(map['notes']?.map((x) => Note.fromMap(x)))
          : [],
      url: map['url'],
      account: Account.fromMap(map['account']),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  static Contact fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Contact id: $id, object: $object, hash_id: $hashId, first_name: $firstName, last_name: $lastName, nickname: $nickname, gender: $gender, gender_type: $genderType, is_starred: $isStarred, is_partial: $isPartial, is_active: $isActive, is_dead: $isDead, is_me: $isMe, last_called: $lastCalled, last_activity_together: $lastActivityTogether, stay_in_touch_frequency: $stayInTouchFrequency, stay_in_touch_trigger_date: $stayInTouchTriggerDate, information: $information, addresses: $addresses, tags: $tags, statistics: $statistics, contactFields: $contactFields, notes: $notes, url: $url, account: $account, created_at: $createdAt, updated_at: $updatedAt';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    var listEq = ListEquality().equals;

    return o is Contact &&
        o.id == id &&
        o.object == object &&
        o.hashId == hashId &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.nickname == nickname &&
        o.gender == gender &&
        o.genderType == genderType &&
        o.isStarred == isStarred &&
        o.isPartial == isPartial &&
        o.isActive == isActive &&
        o.isDead == isDead &&
        o.isMe == isMe &&
        o.lastCalled == lastCalled &&
        o.lastActivityTogether == lastActivityTogether &&
        o.stayInTouchFrequency == stayInTouchFrequency &&
        o.stayInTouchTriggerDate == stayInTouchTriggerDate &&
        o.information == information &&
        listEq(o.addresses, addresses) &&
        listEq(o.tags, tags) &&
        o.statistics == statistics &&
        listEq(o.contactFields, contactFields) &&
        listEq(o.notes, notes) &&
        o.url == url &&
        o.account == account &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        hashId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        nickname.hashCode ^
        gender.hashCode ^
        genderType.hashCode ^
        isStarred.hashCode ^
        isPartial.hashCode ^
        isActive.hashCode ^
        isDead.hashCode ^
        isMe.hashCode ^
        lastCalled.hashCode ^
        lastActivityTogether.hashCode ^
        stayInTouchFrequency.hashCode ^
        stayInTouchTriggerDate.hashCode ^
        information.hashCode ^
        addresses.hashCode ^
        tags.hashCode ^
        statistics.hashCode ^
        contactFields.hashCode ^
        notes.hashCode ^
        url.hashCode ^
        account.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }

  get initials {
    var firstInitial = firstName.substring(0, 1);
    var secondInitial =
        lastName != null && lastName.length > 0 ? lastName.substring(0, 1) : "";
    return "$firstInitial$secondInitial";
  }
}
