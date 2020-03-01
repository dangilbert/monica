import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/contact/address/address.dart';
import 'package:monica/core/data/model/contact/address/country.dart';
import 'package:monica/core/data/model/contact/avatar.dart';
import 'package:monica/core/data/model/contact/career.dart';
import 'package:monica/core/data/model/contact/contact_field_type.dart';
import 'package:monica/core/data/model/contact/contact_fields.dart';
import 'package:monica/core/data/model/contact/dates.dart';
import 'package:monica/core/data/model/contact/how_you_met.dart';
import 'package:monica/core/data/model/contact/information.dart';
import 'package:monica/core/data/model/contact/monica_date.dart';
import 'package:monica/core/data/model/contact/note.dart';
import 'package:monica/core/data/model/contact/relationships.dart';
import 'package:monica/core/data/model/contact/relationships/relationship.dart';
import 'package:monica/core/data/model/contact/statistics.dart';
import 'package:monica/core/data/model/contact/tag.dart';

void main() {
  var testContactJson = '''
  {
    "id": 1,
    "object": "contact",
    "hash_id": "h:Y5LOkAdWNDqgVomKPv",
    "first_name": "Frieda",
    "last_name": "Mayer",
    "nickname": "Prof. Shawna Kunze",
    "gender": "Woman",
    "gender_type": "F",
    "is_starred": false,
    "is_partial": false,
    "is_active": true,
    "is_dead": false,
    "is_me": false,
    "last_called": null,
    "last_activity_together": "2019-05-19T00:00:00.000000Z",
    "stay_in_touch_frequency": null,
    "stay_in_touch_trigger_date": null,
    "information": {
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
          "is_age_based": true,
          "is_year_unknown": false,
          "date": "2003-01-01T00:00:00Z"
        },
        "deceased_date": {
          "is_age_based": null,
          "is_year_unknown": null,
          "date": null
        }
      },
      "career": {
        "job": "Programmer",
        "company": "Monica HQ"
      },
      "avatar": {
        "url": "https:\/\/monica.test\/storage\/avatars\/f7cd73b9-5027-4f66-ab8d-1d578b7a2274.jpg?1579446377",
        "source": "default",
        "default_avatar_color": "#ff9807"
      },
      "food_preferences": "First, she tried the roots of trees, and I've tried to get dry very soon. 'Ahem!' said the Cat. 'I don't think--' 'Then you shouldn't talk,' said the Mock Turtle, capering wildly about. 'Change.",
      "how_you_met": {
        "general_information": null,
        "first_met_date": {
          "is_age_based": null,
          "is_year_unknown": null,
          "date": null
        },
        "first_met_through_contact": null
      }
    },
    "addresses": [
      {
        "id": 1,
        "object": "address",
        "name": "qui",
        "street": null,
        "city": "East Mabelleburgh",
        "province": null,
        "postal_code": "61454-4639",
        "latitude": null,
        "longitude": null,
        "country": {
          "id": "SZ",
          "object": "country",
          "name": "Eswatini",
          "iso": "SZ"
        },
        "url": "https:\/\/monica.test\/api\/addresses\/1",
        "account": {
          "id": 1
        },
        "contact": null,
        "created_at": "2020-01-19T15:06:17Z",
        "updated_at": "2020-01-19T15:06:17Z"
      }
    ],
    "tags": [
      {
        "id": 1,
        "object": "tag",
        "name": "qui",
        "name_slug": "qui",
        "account": {
          "id": 1
        },
        "created_at": "2020-01-19T15:06:17Z",
        "updated_at": "2020-01-19T15:06:17Z"
      }
    ],
    "statistics": {
      "number_of_calls": 0,
      "number_of_notes": 0,
      "number_of_activities": 2,
      "number_of_reminders": 0,
      "number_of_tasks": 0,
      "number_of_gifts": 7,
      "number_of_debts": 0
    },
    "contactFields": [
      {
        "id": 69,
        "object": "contactfield",
        "content": "asdfas",
        "contact_field_type": {
          "id": 1,
          "object": "contactfieldtype",
          "name": "Email",
          "fontawesome_icon": "fa fa-envelope-open-o",
          "protocol": "mailto:",
          "delible": false,
          "type": "email",
          "account": {
            "id": 1
          },
          "created_at": "2020-01-19T15:06:17Z",
          "updated_at": "2020-01-19T15:06:17Z"
        },
        "account": {
          "id": 1
        },
        "contact": null,
        "created_at": "2020-01-31T22:08:03Z",
        "updated_at": "2020-01-31T22:08:03Z"
      }
    ],
     "notes": [
      {
        "id": 115,
        "object": "note",
        "body": "This is an awesome note",
        "is_favorited": false,
        "favorited_at": null,
        "url": "https:\/\/monica.test\/api\/notes\/115",
        "account": {
          "id": 1
        },
        "contact": null,
        "created_at": "2020-01-31T22:30:38Z",
        "updated_at": "2020-01-31T22:30:38Z"
      }
    ],
    "url": "https:\/\/monica.test\/api\/contacts\/1",
    "account": {
      "id": 1
    },
    "created_at": "2020-01-19T15:06:17Z",
    "updated_at": "2020-01-31T22:08:09Z"
  }
  ''';

  var testContact = Contact(
    id: 1,
    object: "contact",
    hashId: "h:Y5LOkAdWNDqgVomKPv",
    firstName: "Frieda",
    lastName: "Mayer",
    nickname: "Prof. Shawna Kunze",
    gender: "Woman",
    genderType: "F",
    isStarred: false,
    isPartial: false,
    isActive: true,
    isDead: false,
    isMe: false,
    lastCalled: null,
    lastActivityTogether: "2019-05-19T00:00:00.000000Z",
    stayInTouchFrequency: null,
    stayInTouchTriggerDate: null,
    information: Information(
        relationships: Relationships(
            love: Relationship(total: 0, contacts: []),
            family: Relationship(total: 0, contacts: []),
            friend: Relationship(total: 0, contacts: []),
            work: Relationship(total: 0, contacts: [])),
        dates: Dates(
            birthdate: MonicaDate(
                isAgeBased: true,
                isYearUnknown: false,
                date: DateTime.parse("2003-01-01T00:00:00Z")),
            deceasedDate:
                MonicaDate(isAgeBased: null, isYearUnknown: null, date: null)),
        career: Career(job: "Programmer", company: "Monica HQ"),
        avatar: Avatar(
            url:
                "https:\/\/monica.test\/storage\/avatars\/f7cd73b9-5027-4f66-ab8d-1d578b7a2274.jpg?1579446377",
            source: "default",
            defaultAvatarColor: "#ff9807"),
        foodPreferences:
            "First, she tried the roots of trees, and I've tried to get dry very soon. 'Ahem!' said the Cat. 'I don't think--' 'Then you shouldn't talk,' said the Mock Turtle, capering wildly about. 'Change.",
        howYouMet: HowYouMet(
            generalInformation: null,
            firstMetDate:
                MonicaDate(isAgeBased: null, isYearUnknown: null, date: null),
            firstMetThroughContact: null)),
            addresses: [
      Address(
        id: 1,
        object: "address",
        name: "qui",
        street: null,
        city: "East Mabelleburgh",
        province: null,
        postalCode: "61454-4639",
        latitude: null,
        longitude: null,
        country: Country(
          id: "SZ",
          object: "country",
          name: "Eswatini",
          iso: "SZ"
        ),
        url: "https:\/\/monica.test\/api\/addresses\/1",
        account: Account(
          id: 1
        ),
        contact: null,
        createdAt: "2020-01-19T15:06:17Z",
        updatedAt: "2020-01-19T15:06:17Z"
      )
    ],
    tags: [
      Tag(
        id: 1,
        object: "tag",
        name: "qui",
        nameSlug: "qui",
        account: Account(
          id: 1
      ),
        createdAt: "2020-01-19T15:06:17Z",
        updatedAt: "2020-01-19T15:06:17Z"
      )
    ],
    statistics: Statistics(
      numberOfCalls: 0,
      numberOfNotes: 0,
      numberOfActivities: 2,
      numberOfReminders: 0,
      numberOfTasks: 0,
      numberOfGifts: 7,
      numberOfDebts: 0
    ),
    contactFields: [
      ContactField(
        id: 69,
        object: "contactfield",
        content: "asdfas",
        contactFieldType: ContactFieldType(
          id: 1,
          object: "contactfieldtype",
          name: "Email",
          fontawesomeIcon: "fa fa-envelope-open-o",
          protocol: "mailto:",
          delible: false,
          type: "email",
          account: Account(
            id: 1
          ),
          createdAt: "2020-01-19T15:06:17Z",
          updatedAt: "2020-01-19T15:06:17Z"
        ),
        account: Account(
          id: 1
        ),
        contact: null,
        createdAt: "2020-01-31T22:08:03Z",
        updatedAt: "2020-01-31T22:08:03Z"
      )
    ],
     notes: [
      Note(
        id: 115,
        object: "note",
        body: "This is an awesome note",
        isFavorited: false,
        favoritedAt: null,
        url: "https:\/\/monica.test\/api\/notes\/115",
        account: Account(
          id: 1
        ),
        contact: null,
        createdAt: "2020-01-31T22:30:38Z",
        updatedAt: "2020-01-31T22:30:38Z"
      )
    ],
    url: "https:\/\/monica.test\/api\/contacts\/1",
    account: Account(
      id: 1
    ),
    createdAt: "2020-01-19T15:06:17Z",
    updatedAt: "2020-01-31T22:08:09Z"
  );

  var testContactString = "Contact id: 1, object: contact, hash_id: h:Y5LOkAdWNDqgVomKPv, first_name: Frieda, last_name: Mayer, nickname: Prof. Shawna Kunze, gender: Woman, gender_type: F, is_starred: false, is_partial: false, is_active: true, is_dead: false, is_me: false, last_called: null, last_activity_together: 2019-05-19T00:00:00.000000Z, stay_in_touch_frequency: null, stay_in_touch_trigger_date: null, information: Information relationships: Relationships love: Relationship total: 0, contacts: [], family: Relationship total: 0, contacts: [], friend: Relationship total: 0, contacts: [], work: Relationship total: 0, contacts: [], dates: Dates birthdate: Birthdate isAgeBased: true, isYearUnknown: false, date: 2003-01-01 00:00:00.000Z, deceased_date: Birthdate isAgeBased: null, isYearUnknown: null, date: null, career: Career job: Programmer, company: Monica HQ, avatar: Avatar url: https://monica.test/storage/avatars/f7cd73b9-5027-4f66-ab8d-1d578b7a2274.jpg?1579446377, source: default, default_avatar_color: #ff9807, food_preferences: First, she tried the roots of trees, and I've tried to get dry very soon. 'Ahem!' said the Cat. 'I don't think--' 'Then you shouldn't talk,' said the Mock Turtle, capering wildly about. 'Change., how_you_met: How_you_met general_information: null, first_met_date: Birthdate isAgeBased: null, isYearUnknown: null, date: null, first_met_through_contact: null, addresses: [Addresse id: 1, object: address, name: qui, street: null, city: East Mabelleburgh, province: null, postal_code: 61454-4639, latitude: null, longitude: null, country: Country id: SZ, object: country, name: Eswatini, iso: SZ, url: https://monica.test/api/addresses/1, account: Account id: 1, contact: null, created_at: 2020-01-19T15:06:17Z, updated_at: 2020-01-19T15:06:17Z], tags: [Tag id: 1, object: tag, name: qui, name_slug: qui, account: Account id: 1, created_at: 2020-01-19T15:06:17Z, updated_at: 2020-01-19T15:06:17Z], statistics: Statistics number_of_calls: 0, number_of_notes: 0, number_of_activities: 2, number_of_reminders: 0, number_of_tasks: 0, number_of_gifts: 7, number_of_debts: 0, contactFields: [ContactField id: 69, object: contactfield, content: asdfas, contact_field_type: Contact_field_type id: 1, object: contactfieldtype, name: Email, fontawesome_icon: fa fa-envelope-open-o, protocol: mailto:, delible: false, type: email, account: Account id: 1, created_at: 2020-01-19T15:06:17Z, updated_at: 2020-01-19T15:06:17Z, account: Account id: 1, contact: null, created_at: 2020-01-31T22:08:03Z, updated_at: 2020-01-31T22:08:03Z], notes: [Note id: 115, object: note, body: This is an awesome note, is_favorited: false, favorited_at: null, url: https://monica.test/api/notes/115, account: Account id: 1, contact: null, created_at: 2020-01-31T22:30:38Z, updated_at: 2020-01-31T22:30:38Z], url: https://monica.test/api/contacts/1, account: Account id: 1, created_at: 2020-01-19T15:06:17Z, updated_at: 2020-01-31T22:08:09Z";

  test('valid contact json decoded correctly', () async {
    expect(Contact.fromJson(testContactJson), testContact);
  });

  test('contact toJson renders contact correctly', () async {
    expect(jsonDecode(testContact.toJson()), jsonDecode(testContactJson));
  });

  test('hashcode matches', () async {
    var contact1 = testContact;
    var contact2 = testContact.copyWith();
    expect(contact1.hashCode, contact2.hashCode);
  });

  test('toString is valid', () async {
    expect(testContact.toString(), testContactString);
  });

  test('initials returns first letter of first and last name', () async {
    expect(Contact(firstName: "Test", lastName: "User").initials, "TU");
  });

  test('initials returns first letter of first name when no last name present', () async {
    expect(Contact(firstName: "Test").initials, "T");
  });
}
