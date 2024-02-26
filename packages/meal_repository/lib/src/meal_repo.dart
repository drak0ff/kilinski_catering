import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:meal_repository/src/models/meal.dart';

import 'abstract_meal_repo.dart';

class MealRepository implements AbstractMealRepo {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  MealRepository(
      {FirebaseFirestore? firestore, FirebaseStorage? firebaseStorage})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

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

  @override
  Future<List<String>?> getDietsNames() async {
    try {
      final dietsSnapshot = await _firestore.collection('Diets').get();
      return dietsSnapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      log("Error getting diets names: $e");
      return null;
    }
  }

  @override
  Future<String?> downloadMealImage(String imageName) async {
    try {
      Reference storageReference =
          _firebaseStorage.ref().child("images/" + imageName);
      String downloadURL = await storageReference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print("Error downloading image: $e");
      return null;
    }
  }
}
