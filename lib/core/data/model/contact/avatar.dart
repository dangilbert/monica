import 'dart:convert';

class Avatar {
  final String url;
  final String source;
  final String defaultAvatarColor;
  Avatar({
    this.url,
    this.source,
    this.defaultAvatarColor,
  });

  Avatar copyWith({
    String url,
    String source,
    String defaultAvatarColor,
  }) {
    return Avatar(
      url: url ?? this.url,
      source: source ?? this.source,
      defaultAvatarColor: defaultAvatarColor ?? this.defaultAvatarColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'source': source,
      'default_avatar_color': defaultAvatarColor,
    };
  }

  static Avatar fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Avatar(
      url: map['url'],
      source: map['source'],
      defaultAvatarColor: map['default_avatar_color'],
    );
  }

  String toJson() => json.encode(toMap());

  static Avatar fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() =>
      'Avatar url: $url, source: $source, default_avatar_color: $defaultAvatarColor';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Avatar &&
        o.url == url &&
        o.source == source &&
        o.defaultAvatarColor == defaultAvatarColor;
  }

  @override
  int get hashCode =>
      url.hashCode ^ source.hashCode ^ defaultAvatarColor.hashCode;
}
