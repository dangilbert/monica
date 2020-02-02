import 'package:monica/core/data/model/account.dart';
import 'package:monica/core/data/model/contact.dart';
import 'package:monica/core/data/model/life_event/life_event_type.dart';

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
    happenedAt = json['happened_at'] != null
        ? DateTime.parse(json['happened_at'])
        : null;
    lifeEventType = json['life_event_type'] != null
        ? new LifeEventType.fromJson(json['life_event_type'])
        : null;
    account = json['account'] != null ? Account.fromMap(json['account']) : null;
    contact = json['contact'] != null ? Contact.fromMap(json['contact']) : null;
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
