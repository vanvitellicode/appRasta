// models/three_d_object.dart
class ThreeDObject {
  final String name;
  final String url;

  ThreeDObject({required this.name, required this.url});

  factory ThreeDObject.fromJson(Map<String, dynamic> json) {
    return ThreeDObject(
      name: json['name'],
      url: json['url'],
    );
  }
}