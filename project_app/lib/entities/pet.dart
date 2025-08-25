import 'package:vader_app/vader_app.dart';

enum PetStatus { available, pending, sold }

class Pet extends VaderEntity {
  final String id;
  final String name;
  final List<String> urls;
  final List<String> tags;

  const Pet({required this.id, required this.name, required this.urls, required this.tags});

  factory Pet.fromJson(Map<String, Object?> json) {
    try {
      return Pet(
        id: json['id'].toString(),
        name: json['name'] as String,
        urls: (json['photoUrls'] as List<dynamic>).where((url) => url != null).map((url) => url as String).toList(),
        tags: (json['tags'] as List<dynamic>).map((e) => e['name'] as String).toList(),
      );
    } catch (e) {
      logger.error("Cannot parse Pet from json: $json");
      rethrow;
    }
  }

  static List<Pet> parseListFromJson(List<Map<String, Object?>> json) {
    return [
      for (var element in json)
        if (element['id'] != null && element['name'] != null && !(element['photoUrls'] as List).contains('string'))
          Pet.fromJson(element)
    ];
  }

  @override
  Map<String, Object?> toJson() {
    return {
      'id': int.parse(id),
      'name': name,
      'photoUrls': urls,
      'tags': tags.map((e) => {'name': e}).toList(),
    };
  }

  @override
  String toString() {
    return 'Pet{id: $id, name: $name, urls: $urls, tags: $tags}';
  }

  List<Object?> get props => [id, name, urls, tags];
}
