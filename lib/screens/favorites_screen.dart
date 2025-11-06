import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../widgets/event_card.dart';
import 'event_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<EventProvider>();

    final favoriteEvents = provider.events
        .where((event) => provider.isFavorite(event.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
      ),
      body: favoriteEvents.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Aucun favori pour le moment',
              style: TextStyle(fontSize: 18, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Appuyez sur le ❤️ sur un événement pour l\'ajouter.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: favoriteEvents.length,
        itemBuilder: (context, index) {
          final event = favoriteEvents[index];
          return EventCard(
            event: event,
            isFavorite: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EventDetailScreen(event: event),
                ),
              );
            },
            onFavorite: () => provider.toggleFavorite(event),
          );
        },
      ),
    );
  }
}
