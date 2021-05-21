import 'dart:convert';

class University {
  final String name;
  final String url;
  final String country;
  University({
    this.name,
    this.url,
    this.country,
  });

  factory University.fromMap(Map<String, dynamic> map) {
    return University(
      name: map['name'],
      url: map['web_pages'].first,
      country: map['country'],
    );
  }

  factory University.fromJson(String source) =>
      University.fromMap(json.decode(source));
}
