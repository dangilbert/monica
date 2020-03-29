import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/contact/avatar.dart';
import 'package:monica/core/data/model/contact/career.dart';
import 'package:monica/core/data/model/contact/dates.dart';
import 'package:monica/core/data/model/contact/how_you_met.dart';
import 'package:monica/core/data/model/contact/information.dart';
import 'package:monica/core/data/model/contact/monica_date.dart';
import 'package:monica/core/data/model/contact/relationships.dart';
import 'package:monica/core/data/model/contact/relationships/relationship.dart';

void main() {
  var testInformation = Information(
      relationships: Relationships(
        love: Relationship(total: 0, contacts: []),
        family: Relationship(total: 0, contacts: []),
        friend: Relationship(total: 0, contacts: []),
        work: Relationship(total: 0, contacts: []),
      ),
      dates: Dates(
        birthdate: MonicaDate(),
        deceasedDate: MonicaDate(),
      ),
      career: Career(),
      avatar: Avatar(
          url: "https:\/\/randomuser.me\/api\/portraits\/men\/39.jpg",
          source: "external"),
      foodPreferences:
          "Alice was a paper label, with the distant sobs of the March Hare. Visit either you like: they're both mad.' 'But I don't believe you do lessons?' said Alice, 'because I'm not myself, you see.' 'I.",
      howYouMet: HowYouMet(
          generalInformation: "King exclaimed.",
          firstMetDate:
              MonicaDate(isAgeBased: null, isYearUnknown: null, date: null),
          firstMetThroughContact: null));

  var testInformationJson = """
    {
	"relationships": {
		"love": {
			"total": 0,
			"contacts": []
		},
		"family": {
			"total": 0,
			"contacts": []
		},
		"friend": {
			"total": 0,
			"contacts": []
		},
		"work": {
			"total": 0,
			"contacts": []
		}
	},
	"dates": {
		"birthdate": {
			"is_age_based": null,
			"is_year_unknown": null,
			"date": null
		},
		"deceased_date": {
			"is_age_based": null,
			"is_year_unknown": null,
			"date": null
		}
	},
	"career": {
		"job": null,
		"company": null
	},
	"avatar": {
		"url": "https:\/\/randomuser.me\/api\/portraits\/men\/39.jpg",
		"source": "external",
    "default_avatar_color": null
	},
	"food_preferences": "Alice was a paper label, with the distant sobs of the March Hare. Visit either you like: they're both mad.' 'But I don't believe you do lessons?' said Alice, 'because I'm not myself, you see.' 'I.",
	"how_you_met": {
		"general_information": "King exclaimed.",
		"first_met_date": {
			"is_age_based": null,
			"is_year_unknown": null,
			"date": null
		},
		"first_met_through_contact": null
	}
}
  """;

  test('valid information json decoded correctly', () async {
    expect(Information.fromJson(testInformationJson), testInformation);
  });

  test('avatar toJson renders avatar correctly', () async {
    expect(
        jsonDecode(testInformation.toJson()), jsonDecode(testInformationJson));
  });

  test('hashcode matches', () async {
    var info1 = testInformation;
    var info2 = testInformation.copyWith();
    expect(info1.hashCode, info2.hashCode);
  });
}
