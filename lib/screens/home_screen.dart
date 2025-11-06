import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../providers/event_provider.dart';
import '../widgets/event_card.dart';
import 'event_detail_screen.dart';
import 'favorites_screen.dart';

class Country {
  final String name;
  final String code;

  Country(this.name, this.code);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _cityController;
  Timer? _debounce;

  final List<Country> _countries = [
    Country('France', 'FR'),
    Country('United States', 'US'),
    Country('Canada', 'CAN'),
    Country('United Kingdom', 'GB'),
    Country('Australia', 'AU'),
    Country('Germany', 'DE'),
    Country('Spain', 'ES'),
  ];

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<EventProvider>(context, listen: false);
    _cityController = TextEditingController(text: provider.city);
    _cityController.addListener(_onCityChanged);

    provider.addListener(() {
      if (provider.city == null && _cityController.text.isNotEmpty) {
        _cityController.clear();
      }
    });
  }

  void _onCityChanged() {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      Provider.of<EventProvider>(context, listen: false).setCity(_cityController.text);
    });
  }

  @override
  void dispose() {
    _cityController.removeListener(_onCityChanged);
    _cityController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

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
          _buildFilters(context),
          _buildCategoryFilter(context),
          Expanded(child: _buildEventList(context)),
        ],
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
    final provider = context.watch<EventProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: DropdownButtonFormField<String>(
              value: provider.countryCode,
              items: _countries.map((Country country) {
                return DropdownMenuItem<String>(
                  value: country.code,
                  child: Text(country.name),
                );
              }).toList(),
              onChanged: (String? newCode) {
                if (newCode != null) {
                  provider.setCountryCode(newCode);
                }
              },
              decoration: InputDecoration(
                labelText: 'Pays',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: TextField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'Ville',
                prefixIcon: const Icon(Icons.location_city),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _cityController.clear(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
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

    if (provider.isLoading && provider.events.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }

    if (provider.events.isEmpty) {
      return const Center(child: Text('Aucun événement trouvé'));
    }

    return RefreshIndicator(
      onRefresh: () => Provider.of<EventProvider>(context, listen: false).fetchEvents(),
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
