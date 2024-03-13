import 'package:equatable/equatable.dart';
import 'package:meal_repository/meal_repository.dart';

sealed class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object?> get props => [];
}

class DisplayInit extends MenuState {}

class DisplayMenuData extends MenuState {
  final List<Meal>? meals;

  const DisplayMenuData({required this.meals});
}

class DisplayMenuError extends MenuState {
  final String error;

  const DisplayMenuError({required this.error});
}
