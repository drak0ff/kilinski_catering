import 'package:meal_repository/src/models/meal.dart';

abstract class AbstractMealRepo {
  Future<List<Meal>?> getMealsByDiet(String dietName);
  Future<List<Meal>?> getMealsByMealType(String dietName, MealType mealtime);
}
