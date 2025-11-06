import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import 'event_detail_screen.dart';

import '../widgets/event_card.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Événements'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Provider.of<EventProvider>(context, listen: false).fetchEvents(),
        child: Consumer<EventProvider>(
          builder: (context, provider, child) {

            if (provider.isLoading && provider.events.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.errorMessage != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Erreur: ${provider.errorMessage}'),
                ),
              );
            }

            if (provider.events.isEmpty) {
              return const Center(child: Text('Aucun événement trouvé.'));
            }

            final events = provider.events;
            return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];

                return EventCard(
                  event: event,
                  isFavorite: provider.isFavorite(event.id),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventDetailScreen(event: event),
                      ),
                    );
                  },
                  onFavorite: () => provider.toggleFavorite(event),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
