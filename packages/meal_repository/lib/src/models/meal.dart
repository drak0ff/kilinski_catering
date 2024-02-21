import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum MealType { breakfast, dinner, supper, none }

extension TypeString on String {
  MealType get topic {
    switch (this) {
      case 'breakfast':
        return MealType.breakfast;
      case 'dinner':
        return MealType.dinner;
      case 'supper':
        return MealType.supper;
      default:
        return MealType.none;
    }
  }
}

class Meal extends Equatable {
  final List<int>? calorieDensity;
  final String? name;
  final double? rating;
  final MealType? type;

  const Meal(
      {required this.calorieDensity,
      required this.name,
      required this.rating,
      required this.type});

  factory Meal.FromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? option,
  ) {
    final data = snapshot.data();
    return Meal(
      calorieDensity: List<int>.from(data?['CalorieDensity'] ?? []),
      name: data?['Name'],
      rating: data?['Rating'],
      type: (() {
        switch (data?['Type']) {
          case 'breakfast':
            return MealType.breakfast;
          case 'dinner':
            return MealType.dinner;
          case 'supper':
            return MealType.supper;
          default:
            return MealType.none;
        }
      })(),
    );
  }

  Map<String, dynamic> ToFirestore() {
    return {
      if (calorieDensity != null) "calorieDensity": calorieDensity,
      if (name != null) "name": name,
      if (rating != null) "rating": rating,
      if (type != null) "type": type,
    };
  }

  @override
  List<Object?> get props => [calorieDensity, name, rating, type];
}
