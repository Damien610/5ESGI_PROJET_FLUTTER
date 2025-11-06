class Event {
  final String id;
  final String name;
  final String? imageUrl;
  final String? description;
  final String venue;
  final String date;
  final String? url;
  final String category;

  Event({
    required this.id,
    required this.name,
    this.imageUrl,
    this.description,
    required this.venue,
    required this.date,
    this.url,
    required this.category,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    String extractVenue(Map<String, dynamic> json) {
      if (json.containsKey('_embedded') &&
          json['_embedded']['venues'] != null &&
          json['_embedded']['venues'].isNotEmpty) {
        return json['_embedded']['venues'][0]['name'] ?? 'Lieu non spécifié';
      }
      if (json.containsKey('place') && json['place']['city'] != null) {
        return json['place']['city']['name'] ?? 'Lieu non spécifié';
      }
      return 'Lieu non spécifié';
    }

    String? findBestImage(List<dynamic>? images) {
      if (images == null || images.isEmpty) {
        return null;
      }
      final goodQualityImage = images.firstWhere(
            (img) => img['ratio'] == '16_9' && img['width'] >= 640,
        orElse: () => images[0],
      );
      return goodQualityImage['url'];
    }

    return Event(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Sans titre',
      url: json['url'],

      description: json['description'] ?? json['info'] ?? json['pleaseNote'],

      imageUrl: findBestImage(json['images']),
      date: json['dates']?['start']?['localDate'] ?? 'Date inconnue',
      category: json['classifications']?[0]?['segment']?['name'] ?? 'Non classé',

      venue: extractVenue(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'venue': venue,
      'date': date,
      'url': url,
      'category': category,
    };
  }
}
