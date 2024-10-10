import 'package:dio/dio.dart';
import 'meal.dart';

class MealService {
  final String url = 'https://www.themealdb.com/api/json/v1/1/random.php';
  final Dio _dio = Dio();

  Future<Meal> fetchRandomMeal() async {
    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return Meal.fromJson(response.data['meals'][0]);
      } else {
        throw Exception('Failed to load meal');
      }
    } catch (e) {
      throw Exception('Failed to load meal: $e');
    }
  }
}
