import 'package:meal_repository/src/models/meal.dart';

abstract class AbstractMealRepository {
  Future<List<Meal>?> getMealsByDiet(String dietName);
  Future<List<Meal>> getMealsByMealType(Type mealtime);
}