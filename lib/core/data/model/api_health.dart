class ApiHealth {
  Success success;
  ApiLinks links;

  ApiHealth({this.success, this.links});

  ApiHealth.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
    links = json['links'] != null ? new ApiLinks.fromJson(json['links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links.toJson();
    }
    return data;
  }
}

class Success {
  String message;

  Success({this.message});

  Success.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}

class ApiLinks {
  String activitiesUrl;
  String addressesUrl;
  String callsUrl;
  String contactsUrl;
  String conversationsUrl;
  String countriesUrl;
  String currenciesUrl;
  String documentsUrl;
  String journalUrl;
  String notesUrl;
  String relationshipsUrl;
  String statisticsUrl;

  ApiLinks(
      {this.activitiesUrl,
      this.addressesUrl,
      this.callsUrl,
      this.contactsUrl,
      this.conversationsUrl,
      this.countriesUrl,
      this.currenciesUrl,
      this.documentsUrl,
      this.journalUrl,
      this.notesUrl,
      this.relationshipsUrl,
      this.statisticsUrl});

  ApiLinks.fromJson(Map<String, dynamic> json) {
    activitiesUrl = json['activities_url'];
    addressesUrl = json['addresses_url'];
    callsUrl = json['calls_url'];
    contactsUrl = json['contacts_url'];
    conversationsUrl = json['conversations_url'];
    countriesUrl = json['countries_url'];
    currenciesUrl = json['currencies_url'];
    documentsUrl = json['documents_url'];
    journalUrl = json['journal_url'];
    notesUrl = json['notes_url'];
    relationshipsUrl = json['relationships_url'];
    statisticsUrl = json['statistics_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activities_url'] = this.activitiesUrl;
    data['addresses_url'] = this.addressesUrl;
    data['calls_url'] = this.callsUrl;
    data['contacts_url'] = this.contactsUrl;
    data['conversations_url'] = this.conversationsUrl;
    data['countries_url'] = this.countriesUrl;
    data['currencies_url'] = this.currenciesUrl;
    data['documents_url'] = this.documentsUrl;
    data['journal_url'] = this.journalUrl;
    data['notes_url'] = this.notesUrl;
    data['relationships_url'] = this.relationshipsUrl;
    data['statistics_url'] = this.statisticsUrl;
    return data;
  }
}
