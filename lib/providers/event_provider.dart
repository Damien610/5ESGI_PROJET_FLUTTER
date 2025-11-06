import 'package:flutter/material.dart';
import '../models/event.dart';
import '../repositories/event_repository.dart';

class EventProvider extends ChangeNotifier {
  final EventRepository _eventRepository = EventRepository();

  List<Event> _events = [];
  bool _isLoading = false;
  String? _errorMessage;

  String? _city;
  String? _selectedCategory;
  final List<String> _categories = ['Tout', 'Music', 'Sport', 'Miscellaneous', 'Arts & Theatre'];

  final Set<String> _favoriteEventIds = {};

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  String? get city => _city;
  String? get selectedCategory => _selectedCategory;
  List<String> get categories => _categories;

  Set<String> get favoriteEventIds => _favoriteEventIds;

  EventProvider() {
    fetchEvents();
  }

  Future<void> setCity(String newCity) async {
    if (newCity.isEmpty) {
      _city = null;
    } else {
      _city = newCity;
    }
    notifyListeners();
    await fetchEvents();
  }

  Future<void> setCategory(String newCategory) async {
    if (_selectedCategory == newCategory) {
      _selectedCategory = null;
    } else {
      _selectedCategory = newCategory;
    }
    notifyListeners();
    await fetchEvents();
  }

  Future<void> fetchEvents() async {
    _isLoading = true;
    notifyListeners();

    final categoryToFetch = (_selectedCategory == 'Tout') ? null : _selectedCategory;

    try {
      _events = await _eventRepository.getEvents(city: _city, category: categoryToFetch);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
      _events = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool isFavorite(String eventId) => _favoriteEventIds.contains(eventId);

  void toggleFavorite(Event event) {
    if (isFavorite(event.id)) {
      _favoriteEventIds.remove(event.id);
    } else {
      _favoriteEventIds.add(event.id);
    }
    notifyListeners();
  }
}
