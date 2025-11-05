import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/event_provider.dart';
import '../widgets/event_card.dart';
import 'event_detail_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventify'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FavoritesScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCitySelector(context),
          _buildCategoryFilter(context),
          Expanded(child: _buildEventList(context)),
        ],
      ),
    );
  }

  Widget _buildCitySelector(BuildContext context) {
    final provider = context.watch<EventProvider>();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Ville',
          prefixIcon: const Icon(Icons.location_city),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onSubmitted: (value) => provider.setCity(value),
        controller: TextEditingController(text: provider.city),
      ),
    );
  }

  Widget _buildCategoryFilter(BuildContext context) {
    final provider = context.watch<EventProvider>();
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: provider.categories.length,
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          final isSelected = provider.selectedCategory == category;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (_) => provider.setCategory(category),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEventList(BuildContext context) {
    final provider = context.watch<EventProvider>();

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.events.isEmpty) {
      return const Center(child: Text('Aucun événement trouvé'));
    }

    return RefreshIndicator(
      onRefresh: () => provider.fetchEvents(),
      child: ListView.builder(
        itemCount: provider.events.length,
        itemBuilder: (context, index) {
          final event = provider.events[index];
          return EventCard(
            event: event,
            isFavorite: provider.isFavorite(event.id),
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
