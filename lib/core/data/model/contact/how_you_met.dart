import 'dart:convert';

import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/contact/monica_date.dart';

class HowYouMet {
  final String generalInformation;
  final MonicaDate firstMetDate;
  final Contact firstMetThroughContact;
  HowYouMet({
    this.generalInformation,
    this.firstMetDate,
    this.firstMetThroughContact,
  });

  HowYouMet copyWith({
    String generalInformation,
    MonicaDate firstMetDate,
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
      firstMetDate: MonicaDate.fromMap(map['first_met_date']),
      firstMetThroughContact: Contact.fromMap(map['first_met_through_contact']),
    );
  }

  String toJson() => json.encode(toMap());

  static HowYouMet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'How_you_met general_information: $generalInformation, first_met_date: $firstMetDate, first_met_through_contact: $firstMetThroughContact';

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
