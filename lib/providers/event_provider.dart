import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/event.dart';
import '../repositories/event_repository.dart';

class EventProvider extends ChangeNotifier {
  final EventRepository _repository = EventRepository();
  
  List<Event> _events = [];
  List<Event> _favorites = [];
  bool _isLoading = false;
  String _selectedCategory = 'Tous';
  String _city = 'Paris';

  List<Event> get events => _events;
  List<Event> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String get selectedCategory => _selectedCategory;
  String get city => _city;

  final List<String> categories = ['Tous', 'Music', 'Sports', 'Arts', 'Film', 'Miscellaneous'];

  EventProvider() {
    _loadFavorites();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    _isLoading = true;
    notifyListeners();

    _events = await _repository.getEvents(
      city: _city,
      category: _selectedCategory != 'Tous' ? _selectedCategory : null,
    );

    _isLoading = false;
    notifyListeners();
  }

  void setCategory(String category) {
    _selectedCategory = category;
    fetchEvents();
  }

  void setCity(String city) {
    _city = city;
    fetchEvents();
  }

  Future<void> toggleFavorite(Event event) async {
    final index = _favorites.indexWhere((e) => e.id == event.id);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(event);
    }
    await _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(String eventId) {
    return _favorites.any((e) => e.id == eventId);
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = _favorites.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList('favorites', favoritesJson);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList('favorites') ?? [];
    _favorites = favoritesJson
        .map((e) => Event.fromJson(json.decode(e)))
        .toList();
    notifyListeners();
  }
}
