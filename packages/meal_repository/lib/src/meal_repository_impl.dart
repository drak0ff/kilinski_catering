import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_repository/src/models/meal.dart';

import 'abstract_meal_repository.dart';
import 'dart:developer';


class MealRepository implements AbstractMealRepository {
	final FirebaseFirestore _firestore;

	MealRepository({ FirebaseFirestore? firestore,}) 
  : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<Meal>?> getMealsByDiet(String dietName) async {
    try {
      final querySnapshot = await _firestore.collection(dietName).withConverter(
        fromFirestore: Meal.fromFirestore,
        toFirestore: (Meal meal, _) => meal.toFirestore(),
      ).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      log("Error getting meals by diet: $e");
      return null;
    }
  }

  @override
  Future<List<Meal>> getMealsByMealType(String dietName, Type mealtime) async {
    try {
      final collectionReference = await _firestore.collection(dietName).withConverter(
          fromFirestore: Meal.fromFirestore, toFirestore: (Meal meal, _) => meal.toFirestore());
      final meals = collectionReference.where('type', isEqualTo: mealtime).get();

    }
    catch (e) {

    }
    throw UnimplementedError();
  }

}