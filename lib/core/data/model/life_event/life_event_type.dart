import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/life_event/life_event_category.dart';

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
        json['account'] != null ? Account.fromMap(json['account']) : null;
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
