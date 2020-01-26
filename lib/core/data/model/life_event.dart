import 'package:monica/core/data/model/contact.dart';

class LifeEvent {
  int id;
  String object;
  String name;
  Null note;
  DateTime happenedAt;
  LifeEventType lifeEventType;
  Account account;
  Contact contact;
  String createdAt;
  String updatedAt;

  LifeEvent(
      {this.id,
      this.object,
      this.name,
      this.note,
      this.happenedAt,
      this.lifeEventType,
      this.account,
      this.contact,
      this.createdAt,
      this.updatedAt});

  LifeEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    name = json['name'];
    note = json['note'];
    happenedAt = json['happened_at'] != null ? DateTime.parse(json['happened_at']) : null;
    lifeEventType = json['life_event_type'] != null
        ? new LifeEventType.fromJson(json['life_event_type'])
        : null;
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['name'] = this.name;
    data['note'] = this.note;
    data['happened_at'] = this.happenedAt;
    if (this.lifeEventType != null) {
      data['life_event_type'] = this.lifeEventType.toJson();
    }
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LifeEventType {
  int id;
  String object;
  String name;
  bool coreMonicaData;
  String defaultLifeEventTypeKey;
  LifeEventCategory lifeEventCategory;
  Account account;
  String createdAt;
  String updatedAt;

  LifeEventType(
      {this.id,
      this.object,
      this.name,
      this.coreMonicaData,
      this.defaultLifeEventTypeKey,
      this.lifeEventCategory,
      this.account,
      this.createdAt,
      this.updatedAt});

  LifeEventType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    name = json['name'];
    coreMonicaData = json['core_monica_data'];
    defaultLifeEventTypeKey = json['default_life_event_type_key'];
    lifeEventCategory = json['life_event_category'] != null
        ? new LifeEventCategory.fromJson(json['life_event_category'])
        : null;
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['name'] = this.name;
    data['core_monica_data'] = this.coreMonicaData;
    data['default_life_event_type_key'] = this.defaultLifeEventTypeKey;
    if (this.lifeEventCategory != null) {
      data['life_event_category'] = this.lifeEventCategory.toJson();
    }
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class LifeEventCategory {
  int id;
  String object;
  String name;
  bool coreMonicaData;
  String defaultLifeEventCategoryKey;
  Account account;
  String createdAt;
  String updatedAt;

  LifeEventCategory(
      {this.id,
      this.object,
      this.name,
      this.coreMonicaData,
      this.defaultLifeEventCategoryKey,
      this.account,
      this.createdAt,
      this.updatedAt});

  LifeEventCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    name = json['name'];
    coreMonicaData = json['core_monica_data'];
    defaultLifeEventCategoryKey = json['default_life_event_category_key'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['name'] = this.name;
    data['core_monica_data'] = this.coreMonicaData;
    data['default_life_event_category_key'] = this.defaultLifeEventCategoryKey;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
