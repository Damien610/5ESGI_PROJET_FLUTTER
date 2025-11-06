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
  final List<String> _categories = ['Tout', 'Music', 'Sport', 'Miscellaneous', 'Art'];

  String _countryCode = 'FR';

  final Set<String> _favoriteEventIds = {};

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get city => _city;
  String? get selectedCategory => _selectedCategory;
  List<String> get categories => _categories;
  Set<String> get favoriteEventIds => _favoriteEventIds;

  String get countryCode => _countryCode;

  EventProvider() {
    fetchEvents();
  }

  Future<void> setCountryCode(String newCountryCode) async {
    if (_countryCode == newCountryCode) return;

    _countryCode = newCountryCode;
    _city = null;
    notifyListeners();
    await fetchEvents();
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
    final isDeselecting = _selectedCategory == newCategory || newCategory == 'Tout';
    _selectedCategory = isDeselecting ? null : newCategory;

    notifyListeners();
    await fetchEvents();
  }

  Future<void> fetchEvents() async {
    _isLoading = true;
    notifyListeners();

    try {
      _events = await _eventRepository.getEvents(
        city: _city,
        category: _selectedCategory,
        countryCode: _countryCode,
      );
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