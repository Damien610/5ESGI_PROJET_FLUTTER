import '../models/event.dart';
import '../services/api_service.dart';

class EventRepository {
  final ApiService _apiService = ApiService();

  Future<List<Event>> getEvents({String? city, String? category, String? countryCode}) async {
    return await _apiService.fetchEvents(
      city: city,
      category: category,
      countryCode: countryCode,
    );
  }
}
