import 'package:monica/core/data/model/account.dart';

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
    data['default_life_event_category_key'] = this.defaultLifeEventCategoryKey;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
