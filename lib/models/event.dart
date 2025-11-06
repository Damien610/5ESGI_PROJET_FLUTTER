// lib/models/event.dart

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
    // --- AMÉLIORATION : Fonction pour extraire le lieu de manière flexible ---
    String extractVenue(Map<String, dynamic> json) {
      // Cas 1 : Le lieu est dans _embedded (structure la plus courante)
      if (json.containsKey('_embedded') &&
          json['_embedded']['venues'] != null &&
          json['_embedded']['venues'].isNotEmpty) {
        return json['_embedded']['venues'][0]['name'] ?? 'Lieu non spécifié';
      }
      // Cas 2 : Le lieu est dans `place` (structure de repli)
      if (json.containsKey('place') && json['place']['city'] != null) {
        return json['place']['city']['name'] ?? 'Lieu non spécifié';
      }
      // Cas par défaut
      return 'Lieu non spécifié';
    }

    String? findBestImage(List<dynamic>? images) {
      if (images == null || images.isEmpty) {
        return null;
      }
      final goodQualityImage = images.firstWhere(
            (img) => img['ratio'] == '16_9' && img['width'] >= 640, // >= 640 pour plus de flexibilité
        orElse: () => images[0], // S'il n'y en a pas, prend la première
      );
      return goodQualityImage['url'];
    }

    return Event(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Sans titre',
      url: json['url'],

      // La description est parfois directement disponible
      description: json['description'] ?? json['info'] ?? json['pleaseNote'],

      imageUrl: findBestImage(json['images']),
      date: json['dates']?['start']?['localDate'] ?? 'Date inconnue',
      category: json['classifications']?[0]?['segment']?['name'] ?? 'Non classé',

      // On utilise notre nouvelle fonction robuste pour le lieu
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
