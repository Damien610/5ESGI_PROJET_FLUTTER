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
    return Event(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Sans titre',
      imageUrl: json['images']?.isNotEmpty == true ? json['images'][0]['url'] : null,
      description: json['info'] ?? json['description'],
      venue: json['_embedded']?['venues']?[0]?['name'] ?? 'Lieu non spécifié',
      date: json['dates']?['start']?['localDate'] ?? 'Date inconnue',
      url: json['url'],
      category: json['classifications']?[0]?['segment']?['name'] ?? 'Autre',
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
