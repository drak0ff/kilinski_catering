import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meal_repository/meal_repository.dart';

import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MealRepository _mealRepository;

  MenuBloc({required MealRepository menuRepository})
      : _mealRepository = menuRepository,
        super(DisplayInit()) {
    on<MenuData>((event, emit) async {
      try {
        final meals = await _mealRepository.getMealsByDiet(event.dietName);
        emit(DisplayMenuData(meals: meals));
      } catch (e) {
        log("Error in MenuBloc$e");
        emit(DisplayMenuError(error: e.toString()));
      }
    });
  }
}
