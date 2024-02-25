import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:happy_catering/blocs/components_bloc/diet_card_bloc/diet_card_event.dart';
import 'package:meal_repository/meal_repository.dart';

import 'diet_card_state.dart';

class DietCardBloc extends Bloc<DietCardEvent, DietCardState> {
  final MealRepository _mealRepository;

  DietCardBloc({required MealRepository mealRepository})
      : _mealRepository = mealRepository,
        super(DisplayNoDataDietCardState()) {
    on<DisplayDietCard>((event, emit) async {
      try {
        final dietNames = await _mealRepository.getDietsNames();
        emit(DisplayDataDietCardState(dietsNames: dietNames));
      } catch (e) {
        log("Error in DietCardBloc" + e.toString());
        emit(DisplayNoDataDietCardState());
      }
    });
  }
}
