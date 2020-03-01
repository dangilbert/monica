
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:monica/core/data/model/contact/avatar.dart';

void main() {

  var testAvatar = Avatar(
    url: "http://test/avatar.png",
    source: "default",
    defaultAvatarColor: "#800020"
  );

  var testAvatarJson = """
    {
      "url": "http://test/avatar.png",
      "source": "default",
      "default_avatar_color": "#800020"
    }
  """;

test('valid avatar json decoded correctly', () async {
    expect(Avatar.fromJson(testAvatarJson), testAvatar);
  });

  test('avatar toJson renders acatar correctly', () async {
    expect(jsonDecode(testAvatar.toJson()), jsonDecode(testAvatarJson));
  });

  test('hashcode matches', () async {
    var avatar1 = testAvatar;
    var avatar2 = testAvatar.copyWith();
    expect(avatar1.hashCode, avatar2.hashCode);
  });

}