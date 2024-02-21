import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_repository/src/models/meal.dart';

import 'abstract_meal_repo.dart';

class MealRepository implements AbstractMealRepo {
  final FirebaseFirestore _firestore;

  MealRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Meal>?> getMealsByDiet(String dietName) async {
    try {
      final querySnapshot = await _firestore
          .collection(dietName)
          .withConverter(
            fromFirestore: Meal.FromFirestore,
            toFirestore: (Meal meal, _) => meal.ToFirestore(),
          )
          .get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      log("Error getting meals by diet: $e");
      return null;
    }
  }

  @override
  Future<List<Meal>?> getMealsByMealType(
      String dietName, MealType mealtime) async {
    try {
      return await _firestore
          .collection(dietName)
          .withConverter(
              fromFirestore: Meal.FromFirestore,
              toFirestore: (Meal meal, _) => meal.ToFirestore())
          .where('Type', isEqualTo: mealtime.name)
          .get()
          .then((value) => value.docs.map((doc) => doc.data()).toList());
    } catch (e) {
      log("Error getting meals by diet: $e");
      return null;
    }
  }
}
