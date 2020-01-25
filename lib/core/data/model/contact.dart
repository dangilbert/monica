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

  Contact(
      {this.id,
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
      this.updatedAt});

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    firstName = json['first_name'];
    lastName = json['last_name'] ?? "";
    nickname = json['nickname'];
    gender = json['gender'];
    isPartial = json['is_partial'];
    isDead = json['is_dead'];
    lastCalled = json['last_called'];
    lastActivityTogether = json['last_activity_together'] != null
        ? new LastActivityTogether.fromJson(json['last_activity_together'])
        : null;
    stayInTouchFrequency = json['stay_in_touch_frequency'];
    stayInTouchTriggerDate = json['stay_in_touch_trigger_date'];
    information = json['information'] != null
        ? new Information.fromJson(json['information'])
        : null;
    // if (json['addresses'] != null) {
    //   addresses = new List<Null>();
    //   json['addresses'].forEach((v) {
    //     addresses.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['tags'] != null) {
    //   tags = new List<Null>();
    //   json['tags'].forEach((v) {
    //     tags.add(new Null.fromJson(v));
    //   });
    // }
    statistics = json['statistics'] != null
        ? new Statistics.fromJson(json['statistics'])
        : null;
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  get initials {
    var firstInitial = firstName.substring(0, 1);
    var secondInitial =
        lastName != null && lastName.length > 0 ? lastName.substring(0, 1) : "";
    return "$firstInitial$secondInitial";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nickname'] = this.nickname;
    data['gender'] = this.gender;
    data['is_partial'] = this.isPartial;
    data['is_dead'] = this.isDead;
    data['last_called'] = this.lastCalled;
    if (this.lastActivityTogether != null) {
      data['last_activity_together'] = this.lastActivityTogether.toJson();
    }
    data['stay_in_touch_frequency'] = this.stayInTouchFrequency;
    data['stay_in_touch_trigger_date'] = this.stayInTouchTriggerDate;
    if (this.information != null) {
      data['information'] = this.information.toJson();
    }
    // if (this.addresses != null) {
    //   data['addresses'] = this.addresses.map((v) => v.toJson()).toList();
    // }
    // if (this.tags != null) {
    //   data['tags'] = this.tags.map((v) => v.toJson()).toList();
    // }
    if (this.statistics != null) {
      data['statistics'] = this.statistics.toJson();
    }
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LastActivityTogether {
  String date;
  int timezoneType;
  String timezone;

  LastActivityTogether({this.date, this.timezoneType, this.timezone});

  LastActivityTogether.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Information {
  // Relationships relationships;
  Dates dates;
  Career career;
  Avatar avatar;
  String foodPreferencies;
  HowYouMet howYouMet;

  Information(
      {this.dates,
      this.career,
      this.avatar,
      this.foodPreferencies,
      this.howYouMet});

  Information.fromJson(Map<String, dynamic> json) {
    // relationships = json['relationships'] != null
    //     ? new Relationships.fromJson(json['relationships'])
    //     : null;
    dates = json['dates'] != null ? new Dates.fromJson(json['dates']) : null;
    career =
        json['career'] != null ? new Career.fromJson(json['career']) : null;
    avatar =
        json['avatar'] != null ? new Avatar.fromJson(json['avatar']) : null;
    foodPreferencies = json['food_preferencies'];
    howYouMet = json['how_you_met'] != null
        ? new HowYouMet.fromJson(json['how_you_met'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dates != null) {
      data['dates'] = this.dates.toJson();
    }
    if (this.career != null) {
      data['career'] = this.career.toJson();
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    data['food_preferencies'] = this.foodPreferencies;
    if (this.howYouMet != null) {
      data['how_you_met'] = this.howYouMet.toJson();
    }
    return data;
  }
}

// class Relationships {
//   Love love;
//   Family family;
//   Friend friend;
//   Work work;

//   Relationships({this.love, this.family, this.friend, this.work});

//   Relationships.fromJson(Map<String, dynamic> json) {
// love = json['love'] != null ? new Love.fromJson(json['love']) : null;
// family = json['family'] != null ? new Family.fromJson(json['family']) : null;
// friend = json['friend'] != null ? new Friend.fromJson(json['friend']) : null;
// work = json['work'] != null ? new Work.fromJson(json['work']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.love != null) {
//       data['love'] = this.love.toJson();
//     }
//     if (this.family != null) {
//       data['family'] = this.family.toJson();
//     }
//     if (this.friend != null) {
//       data['friend'] = this.friend.toJson();
//     }
//     if (this.work != null) {
//       data['work'] = this.work.toJson();
//     }
//     return data;
//   }
// }

class Love {
  int total;
  List<Contact> contacts;

  Love({this.total, this.contacts});

  Love.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['contacts'] != null) {
      contacts = new List<Null>();
      json['contacts'].forEach((v) {
        contacts.add(new Contact.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.contacts != null) {
      data['contacts'] = this.contacts.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dates {
  Birthdate birthdate;
  Birthdate deceasedDate;

  Dates({this.birthdate, this.deceasedDate});

  Dates.fromJson(Map<String, dynamic> json) {
    birthdate = json['birthdate'] != null
        ? new Birthdate.fromJson(json['birthdate'])
        : null;
    deceasedDate = json['deceased_date'] != null
        ? new Birthdate.fromJson(json['deceased_date'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.birthdate != null) {
      data['birthdate'] = this.birthdate.toJson();
    }
    if (this.deceasedDate != null) {
      data['deceased_date'] = this.deceasedDate.toJson();
    }
    return data;
  }
}

class Career {
  Null job;
  Null company;

  Career({this.job, this.company});

  Career.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job'] = this.job;
    data['company'] = this.company;
    return data;
  }
}

class Avatar {
  String url;
  String source;

  Avatar({this.url, this.source});

  Avatar.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['source'] = this.source;
    return data;
  }
}

class HowYouMet {
  String generalInformation;
  Birthdate firstMetDate;
  FirstMetThroughContact firstMetThroughContact;

  HowYouMet(
      {this.generalInformation,
      this.firstMetDate,
      this.firstMetThroughContact});

  HowYouMet.fromJson(Map<String, dynamic> json) {
    generalInformation = json['general_information'];
    firstMetDate = json['first_met_date'] != null
        ? new Birthdate.fromJson(json['first_met_date'])
        : null;
    firstMetThroughContact = json['first_met_through_contact'] != null
        ? new FirstMetThroughContact.fromJson(json['first_met_through_contact'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['general_information'] = this.generalInformation;
    if (this.firstMetDate != null) {
      data['first_met_date'] = this.firstMetDate.toJson();
    }
    if (this.firstMetThroughContact != null) {
      data['first_met_through_contact'] = this.firstMetThroughContact.toJson();
    }
    return data;
  }
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

  FirstMetThroughContact(
      {this.id,
      this.object,
      this.firstName,
      this.lastName,
      this.nickname,
      this.gender,
      this.isPartial,
      this.isDead,
      this.information,
      this.account});

  FirstMetThroughContact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    nickname = json['nickname'];
    gender = json['gender'];
    isPartial = json['is_partial'];
    isDead = json['is_dead'];
    information = json['information'] != null
        ? new Dates.fromJson(json['information'])
        : null;
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['nickname'] = this.nickname;
    data['gender'] = this.gender;
    data['is_partial'] = this.isPartial;
    data['is_dead'] = this.isDead;
    if (this.information != null) {
      data['information'] = this.information.toJson();
    }
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    return data;
  }
}

class Birthdate {
  bool isAgeBased;
  bool isYearUnknown;
  DateTime date;

  Birthdate({this.isAgeBased, this.isYearUnknown, this.date});

  Birthdate.fromJson(Map<String, dynamic> json) {
    isAgeBased = json['is_age_based'];
    isYearUnknown = json['is_year_unknown'];
    date = json["date"] != null ? DateTime.parse(json['date']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_age_based'] = this.isAgeBased;
    data['is_year_unknown'] = this.isYearUnknown;
    data['date'] = this.date;
    return data;
  }
}

class Account {
  int id;

  Account({this.id});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class Statistics {
  int numberOfCalls;
  int numberOfNotes;
  int numberOfActivities;
  int numberOfReminders;
  int numberOfTasks;
  int numberOfGifts;
  int numberOfDebts;

  Statistics(
      {this.numberOfCalls,
      this.numberOfNotes,
      this.numberOfActivities,
      this.numberOfReminders,
      this.numberOfTasks,
      this.numberOfGifts,
      this.numberOfDebts});

  Statistics.fromJson(Map<String, dynamic> json) {
    numberOfCalls = json['number_of_calls'];
    numberOfNotes = json['number_of_notes'];
    numberOfActivities = json['number_of_activities'];
    numberOfReminders = json['number_of_reminders'];
    numberOfTasks = json['number_of_tasks'];
    numberOfGifts = json['number_of_gifts'];
    numberOfDebts = json['number_of_debts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number_of_calls'] = this.numberOfCalls;
    data['number_of_notes'] = this.numberOfNotes;
    data['number_of_activities'] = this.numberOfActivities;
    data['number_of_reminders'] = this.numberOfReminders;
    data['number_of_tasks'] = this.numberOfTasks;
    data['number_of_gifts'] = this.numberOfGifts;
    data['number_of_debts'] = this.numberOfDebts;
    return data;
  }
}
