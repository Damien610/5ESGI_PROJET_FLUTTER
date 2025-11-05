import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';
import 'mock_data.dart';

class ApiService {
  static const String apiKey = 'TwCKnl5Y8ycdiUsGL8jmAJiDqfhBxMpm';
  static const String baseUrl = 'https://app.ticketmaster.com/discovery/v2';

  Future<List<Event>> fetchEvents({String? city, String? category}) async {
    final params = {
      'apikey': apiKey,
      'size': '20',
      if (city != null && city.isNotEmpty) 'city': city,
      if (category != null && category != 'Tous') 'classificationName': category,
    };

    final uri = Uri.parse('$baseUrl/events.json').replace(queryParameters: params);
    
    try {
      final response = await http.get(uri);
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final events = (data['_embedded']?['events'] as List?)
            ?.map((e) => Event.fromJson(e))
            .toList() ?? [];
        return events.isNotEmpty ? events : MockData.getMockEvents();
      }
      return MockData.getMockEvents();
    } catch (e) {
      return MockData.getMockEvents();
    }
  }
}
