import 'dart:convert';

import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/contact/birthdate.dart';

class HowYouMet {
  String generalInformation;
  Birthdate firstMetDate;
  Contact firstMetThroughContact;
  HowYouMet({
    this.generalInformation,
    this.firstMetDate,
    this.firstMetThroughContact,
  });

  HowYouMet copyWith({
    String generalInformation,
    Birthdate firstMetDate,
    Contact firstMetThroughContact,
  }) {
    return HowYouMet(
      generalInformation: generalInformation ?? this.generalInformation,
      firstMetDate: firstMetDate ?? this.firstMetDate,
      firstMetThroughContact:
          firstMetThroughContact ?? this.firstMetThroughContact,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'general_information': generalInformation,
      'first_met_date': firstMetDate.toMap(),
      'first_met_through_contact': firstMetThroughContact.toMap(),
    };
  }

  static HowYouMet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HowYouMet(
      generalInformation: map['general_information'],
      firstMetDate: Birthdate.fromMap(map['first_met_date']),
      firstMetThroughContact:
          Contact.fromMap(map['first_met_through_contact']),
    );
  }

  String toJson() => json.encode(toMap());

  static HowYouMet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'HowYouMet generalInformation: $generalInformation, firstMetDate: $firstMetDate, firstMetThroughContact: $firstMetThroughContact';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HowYouMet &&
        o.generalInformation == generalInformation &&
        o.firstMetDate == firstMetDate &&
        o.firstMetThroughContact == firstMetThroughContact;
  }

  @override
  int get hashCode =>
      generalInformation.hashCode ^
      firstMetDate.hashCode ^
      firstMetThroughContact.hashCode;
}