import 'dart:convert';

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
