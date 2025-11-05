import '../models/event.dart';
import '../services/api_service.dart';

class EventRepository {
  final ApiService _apiService = ApiService();

  Future<List<Event>> getEvents({String? city, String? category}) async {
    return await _apiService.fetchEvents(city: city, category: category);
  }
}
