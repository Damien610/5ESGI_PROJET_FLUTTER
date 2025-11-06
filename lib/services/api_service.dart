// lib/services/api_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class ApiService {
  final String _apiKey = 'TwCKnl5Y8ycdiUsGL8jmAJiDqfhBxMpm';

  Future<List<Event>> fetchEvents({String? city, String? keyword, String? category}) async {
    final Map<String, dynamic> queryParameters = {
      'apikey': _apiKey,
      'size': '50',
      'sort': 'date,asc',
    };

    if (city != null && city.isNotEmpty) {
      queryParameters['city'] = city;
    }
    if (keyword != null && keyword.isNotEmpty) {
      queryParameters['keyword'] = keyword;
    }

    if (category != null && category.isNotEmpty) {
      queryParameters['classificationName'] = category;
    }

    final uri = Uri.https('app.ticketmaster.com', '/discovery/v2/events.json', queryParameters);

    debugPrint('----------------------------------');
    debugPrint('API Call URL: $uri');

    try {
      final response = await http.get(uri);

      debugPrint('API Response Status Code: ${response.statusCode}');
      if (response.statusCode != 200) {
        debugPrint('API Error Body: ${response.body}');
        throw Exception('Échec du chargement (Code: ${response.statusCode})');
      }

      final Map<String, dynamic> data = json.decode(response.body);

      if (data.containsKey('_embedded')) {
        final List<dynamic> eventList = data['_embedded']['events'];
        debugPrint('${eventList.length} events found in the response.');
        return eventList.map((json) => Event.fromJson(json)).toList();
      } else {
        debugPrint('No "_embedded" key found. Returning empty list.');
        return [];
      }
    } catch (e) {
      debugPrint('An error occurred during API call: $e');
      throw Exception('Une erreur est survenue: $e');
    }
  }
}
