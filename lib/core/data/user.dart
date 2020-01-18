class User {
  Data data;

  User({this.data});

  User.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String object;
  String firstName;
  String lastName;
  String email;
  String timezone;
  Currency currency;
  String locale;
  bool isPolicyCompliant;
  Account account;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.object,
      this.firstName,
      this.lastName,
      this.email,
      this.timezone,
      this.currency,
      this.locale,
      this.isPolicyCompliant,
      this.account,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    timezone = json['timezone'];
    currency = json['currency'] != null
        ? new Currency.fromJson(json['currency'])
        : null;
    locale = json['locale'];
    isPolicyCompliant = json['is_policy_compliant'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['timezone'] = this.timezone;
    if (this.currency != null) {
      data['currency'] = this.currency.toJson();
    }
    data['locale'] = this.locale;
    data['is_policy_compliant'] = this.isPolicyCompliant;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Currency {
  int id;
  String object;
  String iso;
  String name;
  String symbol;

  Currency({this.id, this.object, this.iso, this.name, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    iso = json['iso'];
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['iso'] = this.iso;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
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
