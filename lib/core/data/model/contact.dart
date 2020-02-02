import 'dart:convert';

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
          LastActivityTogether.fromMap(map['last_activity_ogether']),
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

class LastActivityTogether {
  String date;
  int timezoneType;
  String timezone;
  LastActivityTogether({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  LastActivityTogether copyWith({
    String date,
    int timezoneType,
    String timezone,
  }) {
    return LastActivityTogether(
      date: date ?? this.date,
      timezoneType: timezoneType ?? this.timezoneType,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'timezone_type': timezoneType,
      'timezone': timezone,
    };
  }

  static LastActivityTogether fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LastActivityTogether(
      date: map['date'],
      timezoneType: map['timezone_type'],
      timezone: map['timezone'],
    );
  }

  String toJson() => json.encode(toMap());

  static LastActivityTogether fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() =>
      'LastActivityTogether date: $date, timezoneType: $timezoneType, timezone: $timezone';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LastActivityTogether &&
        o.date == date &&
        o.timezoneType == timezoneType &&
        o.timezone == timezone;
  }

  @override
  int get hashCode => date.hashCode ^ timezoneType.hashCode ^ timezone.hashCode;
}

class Information {
  // Relationships relationships;
  Dates dates;
  Career career;
  Avatar avatar;
  String foodPreferencies;
  HowYouMet howYouMet;
  Information({
    // this.relationships,
    this.dates,
    this.career,
    this.avatar,
    this.foodPreferencies,
    this.howYouMet,
  });

  Information copyWith({
    // Relationships relationships,
    Dates dates,
    Career career,
    Avatar avatar,
    String foodPreferencies,
    HowYouMet howYouMet,
  }) {
    return Information(
      // relationships: relationships ?? this.relationships,
      dates: dates ?? this.dates,
      career: career ?? this.career,
      avatar: avatar ?? this.avatar,
      foodPreferencies: foodPreferencies ?? this.foodPreferencies,
      howYouMet: howYouMet ?? this.howYouMet,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'relationships': relationships.toMap(),
      'dates': dates.toMap(),
      'career': career.toMap(),
      'avatar': avatar.toMap(),
      'food_preferencies': foodPreferencies,
      'how_you_met': howYouMet.toMap(),
    };
  }

  static Information fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Information(
      // relationships: // Relationships.fromMap(map['relationships']),
      dates: Dates.fromMap(map['dates']),
      career: Career.fromMap(map['career']),
      avatar: Avatar.fromMap(map['avatar']),
      foodPreferencies: map['food_preferencies'],
      howYouMet: HowYouMet.fromMap(map['how_you_met']),
    );
  }

  String toJson() => json.encode(toMap());

  static Information fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Information dates: $dates, career: $career, avatar: $avatar, foodPreferencies: $foodPreferencies, howYouMet: $howYouMet';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Information &&
        // o.relationships == relationships &&
        o.dates == dates &&
        o.career == career &&
        o.avatar == avatar &&
        o.foodPreferencies == foodPreferencies &&
        o.howYouMet == howYouMet;
  }

  @override
  int get hashCode {
    // return relationships.hashCode ^
    return dates.hashCode ^
        career.hashCode ^
        avatar.hashCode ^
        foodPreferencies.hashCode ^
        howYouMet.hashCode;
  }
}

class Love {
  int total;
  List<Contact> contacts;
  Love({
    this.total,
    this.contacts,
  });

  Love copyWith({
    int total,
    List<Contact> contacts,
  }) {
    return Love(
      total: total ?? this.total,
      contacts: contacts ?? this.contacts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'contacts': List<dynamic>.from(contacts.map((x) => x.toMap())),
    };
  }

  static Love fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Love(
      total: map['total'],
      contacts:
          List<Contact>.from(map['contacts']?.map((x) => Contact.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Love fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Love total: $total, contacts: $contacts';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Love && o.total == total && o.contacts == contacts;
  }

  @override
  int get hashCode => total.hashCode ^ contacts.hashCode;
}

class Dates {
  Birthdate birthdate;
  Birthdate deceasedDate;
  Dates({
    this.birthdate,
    this.deceasedDate,
  });

  Dates copyWith({
    Birthdate birthdate,
    Birthdate deceasedDate,
  }) {
    return Dates(
      birthdate: birthdate ?? this.birthdate,
      deceasedDate: deceasedDate ?? this.deceasedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'birthdate': birthdate.toMap(),
      'deceased_date': deceasedDate.toMap(),
    };
  }

  static Dates fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Dates(
      birthdate: Birthdate.fromMap(map['birthdate']),
      deceasedDate: Birthdate.fromMap(map['deceased_date']),
    );
  }

  String toJson() => json.encode(toMap());

  static Dates fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Dates birthdate: $birthdate, deceasedDate: $deceasedDate';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Dates &&
        o.birthdate == birthdate &&
        o.deceasedDate == deceasedDate;
  }

  @override
  int get hashCode => birthdate.hashCode ^ deceasedDate.hashCode;
}

class Career {
  Null job;
  Null company;
  Career({
    this.job,
    this.company,
  });

  Career copyWith({
    Null job,
    Null company,
  }) {
    return Career(
      job: job ?? this.job,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'job': job,
      'company': company,
    };
  }

  static Career fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Career(
      job: map['job'],
      company: map['company'],
    );
  }

  String toJson() => json.encode(toMap());

  static Career fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Career job: $job, company: $company';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Career && o.job == job && o.company == company;
  }

  @override
  int get hashCode => job.hashCode ^ company.hashCode;
}

class Avatar {
  String url;
  String source;
  Avatar({
    this.url,
    this.source,
  });

  Avatar copyWith({
    String url,
    String source,
  }) {
    return Avatar(
      url: url ?? this.url,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'source': source,
    };
  }

  static Avatar fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Avatar(
      url: map['url'],
      source: map['source'],
    );
  }

  String toJson() => json.encode(toMap());

  static Avatar fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Avatar url: $url, source: $source';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Avatar && o.url == url && o.source == source;
  }

  @override
  int get hashCode => url.hashCode ^ source.hashCode;
}

class HowYouMet {
  String generalInformation;
  Birthdate firstMetDate;
  FirstMetThroughContact firstMetThroughContact;
  HowYouMet({
    this.generalInformation,
    this.firstMetDate,
    this.firstMetThroughContact,
  });

  HowYouMet copyWith({
    String generalInformation,
    Birthdate firstMetDate,
    FirstMetThroughContact firstMetThroughContact,
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
          FirstMetThroughContact.fromMap(map['first_met_through_contact']),
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

class FirstMetThroughContact {
  int id;
  String object;
  String firstName;
  String lastName;
  String nickname;
  String gender;
  bool isPartial;
  bool isDead;
  Dates information;
  Account account;
  FirstMetThroughContact({
    this.id,
    this.object,
    this.firstName,
    this.lastName,
    this.nickname,
    this.gender,
    this.isPartial,
    this.isDead,
    this.information,
    this.account,
  });

  FirstMetThroughContact copyWith({
    int id,
    String object,
    String firstName,
    String lastName,
    String nickname,
    String gender,
    bool isPartial,
    bool isDead,
    Dates information,
    Account account,
  }) {
    return FirstMetThroughContact(
      id: id ?? this.id,
      object: object ?? this.object,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      nickname: nickname ?? this.nickname,
      gender: gender ?? this.gender,
      isPartial: isPartial ?? this.isPartial,
      isDead: isDead ?? this.isDead,
      information: information ?? this.information,
      account: account ?? this.account,
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
      'information': information.toMap(),
      'account': account.toMap(),
    };
  }

  static FirstMetThroughContact fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FirstMetThroughContact(
      id: map['id'],
      object: map['object'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      nickname: map['nickname'],
      gender: map['gender'],
      isPartial: map['is_partial'],
      isDead: map['is_dead'],
      information: Dates.fromMap(map['information']),
      account: Account.fromMap(map['account']),
    );
  }

  String toJson() => json.encode(toMap());

  static FirstMetThroughContact fromJson(String source) =>
      fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirstMetThroughContact id: $id, object: $object, firstName: $firstName, lastName: $lastName, nickname: $nickname, gender: $gender, isPartial: $isPartial, isDead: $isDead, information: $information, account: $account';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FirstMetThroughContact &&
        o.id == id &&
        o.object == object &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.nickname == nickname &&
        o.gender == gender &&
        o.isPartial == isPartial &&
        o.isDead == isDead &&
        o.information == information &&
        o.account == account;
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
        information.hashCode ^
        account.hashCode;
  }
}

class Birthdate {
  bool isAgeBased;
  bool isYearUnknown;
  DateTime date;
  Birthdate({
    this.isAgeBased,
    this.isYearUnknown,
    this.date,
  });

  Birthdate copyWith({
    bool isAgeBased,
    bool isYearUnknown,
    DateTime date,
  }) {
    return Birthdate(
      isAgeBased: isAgeBased ?? this.isAgeBased,
      isYearUnknown: isYearUnknown ?? this.isYearUnknown,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'is_age_based': isAgeBased,
      'is_year_unknown': isYearUnknown,
      'date': date.millisecondsSinceEpoch,
    };
  }

  static Birthdate fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Birthdate(
      isAgeBased: map['is_age_based'],
      isYearUnknown: map['is_year_unknown'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  static Birthdate fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Birthdate isAgeBased: $isAgeBased, isYearUnknown: $isYearUnknown, date: $date';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Birthdate &&
        o.isAgeBased == isAgeBased &&
        o.isYearUnknown == isYearUnknown &&
        o.date == date;
  }

  @override
  int get hashCode =>
      isAgeBased.hashCode ^ isYearUnknown.hashCode ^ date.hashCode;
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

    return o is Account && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class Statistics {
  int numberOfCalls;
  int numberOfNotes;
  int numberOfActivities;
  int numberOfReminders;
  int numberOfTasks;
  int numberOfGifts;
  int numberOfDebts;
  Statistics({
    this.numberOfCalls,
    this.numberOfNotes,
    this.numberOfActivities,
    this.numberOfReminders,
    this.numberOfTasks,
    this.numberOfGifts,
    this.numberOfDebts,
  });

  Statistics copyWith({
    int numberOfCalls,
    int numberOfNotes,
    int numberOfActivities,
    int numberOfReminders,
    int numberOfTasks,
    int numberOfGifts,
    int numberOfDebts,
  }) {
    return Statistics(
      numberOfCalls: numberOfCalls ?? this.numberOfCalls,
      numberOfNotes: numberOfNotes ?? this.numberOfNotes,
      numberOfActivities: numberOfActivities ?? this.numberOfActivities,
      numberOfReminders: numberOfReminders ?? this.numberOfReminders,
      numberOfTasks: numberOfTasks ?? this.numberOfTasks,
      numberOfGifts: numberOfGifts ?? this.numberOfGifts,
      numberOfDebts: numberOfDebts ?? this.numberOfDebts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number_of_calls': numberOfCalls,
      'number_of_notes': numberOfNotes,
      'number_of_activities': numberOfActivities,
      'number_of_reminders': numberOfReminders,
      'number_of_tasks': numberOfTasks,
      'number_of_gifts': numberOfGifts,
      'number_of_debts': numberOfDebts,
    };
  }

  static Statistics fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Statistics(
      numberOfCalls: map['number_of_calls'],
      numberOfNotes: map['number_of_notes'],
      numberOfActivities: map['number_of_activities'],
      numberOfReminders: map['number_of_reminders'],
      numberOfTasks: map['number_of_tasks'],
      numberOfGifts: map['number_of_gifts'],
      numberOfDebts: map['number_of_debts'],
    );
  }

  String toJson() => json.encode(toMap());

  static Statistics fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Statistics numberOfCalls: $numberOfCalls, numberOfNotes: $numberOfNotes, numberOfActivities: $numberOfActivities, numberOfReminders: $numberOfReminders, numberOfTasks: $numberOfTasks, numberOfGifts: $numberOfGifts, numberOfDebts: $numberOfDebts';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Statistics &&
        o.numberOfCalls == numberOfCalls &&
        o.numberOfNotes == numberOfNotes &&
        o.numberOfActivities == numberOfActivities &&
        o.numberOfReminders == numberOfReminders &&
        o.numberOfTasks == numberOfTasks &&
        o.numberOfGifts == numberOfGifts &&
        o.numberOfDebts == numberOfDebts;
  }

  @override
  int get hashCode {
    return numberOfCalls.hashCode ^
        numberOfNotes.hashCode ^
        numberOfActivities.hashCode ^
        numberOfReminders.hashCode ^
        numberOfTasks.hashCode ^
        numberOfGifts.hashCode ^
        numberOfDebts.hashCode;
  }
}
