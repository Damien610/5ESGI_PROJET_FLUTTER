import '../models/event.dart';

class MockData {
  static List<Event> getMockEvents() {
    return [
      Event(
        id: '1',
        name: 'Concert de Jazz à Paris',
        imageUrl: 'https://picsum.photos/400/300?random=1',
        description: 'Une soirée exceptionnelle de jazz avec les meilleurs artistes.',
        venue: 'Olympia, Paris',
        date: '2025-02-15',
        url: 'https://www.ticketmaster.fr',
        category: 'Music',
      ),
      Event(
        id: '2',
        name: 'Match PSG vs OM',
        imageUrl: 'https://picsum.photos/400/300?random=2',
        description: 'Le classique du football français.',
        venue: 'Parc des Princes, Paris',
        date: '2025-02-20',
        url: 'https://www.ticketmaster.fr',
        category: 'Sports',
      ),
      Event(
        id: '3',
        name: 'Exposition Monet',
        imageUrl: 'https://picsum.photos/400/300?random=3',
        description: 'Découvrez les chefs-d\'œuvre de Claude Monet.',
        venue: 'Musée d\'Orsay, Paris',
        date: '2025-03-01',
        url: 'https://www.ticketmaster.fr',
        category: 'Arts',
      ),
      Event(
        id: '4',
        name: 'Festival Électro',
        imageUrl: 'https://picsum.photos/400/300?random=4',
        description: 'Le plus grand festival de musique électronique.',
        venue: 'Bercy Arena, Paris',
        date: '2025-03-10',
        url: 'https://www.ticketmaster.fr',
        category: 'Music',
      ),
      Event(
        id: '5',
        name: 'Conférence Tech',
        imageUrl: 'https://picsum.photos/400/300?random=5',
        description: 'Les dernières innovations technologiques.',
        venue: 'Palais des Congrès, Paris',
        date: '2025-03-15',
        url: 'https://www.ticketmaster.fr',
        category: 'Miscellaneous',
      ),
    ];
  }
}
