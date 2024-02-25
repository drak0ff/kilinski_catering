import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_catering/blocs/components_bloc/order_card_bloc/order_card_event.dart';
import 'package:happy_catering/blocs/components_bloc/order_card_bloc/order_card_state.dart';
import 'package:meal_repository/meal_repository.dart';
import 'package:order_repository/order_repository.dart';

class OrderCardBloc extends Bloc<OrderCardEvent, OrderCardState> {
  final OrderRepository _orderRepository;
  final MealRepository _mealRepository;

  OrderCardBloc(
      {required OrderRepository orderRepository,
      required MealRepository mealRepository})
      : _orderRepository = orderRepository,
        _mealRepository = mealRepository,
        super(DisplayNoDataOrderCardState()) {
    on<DisplayMealOrderCard>((event, emit) async {
      try {
        final orders = await _orderRepository
            .getOrders(FirebaseAuth.instance.currentUser?.uid);

        List<String?> imageUrls = orders?.map((meal) {
              _mealRepository
                  .downloadMealImage(meal.dietName.toString() + '.png');
            }).toList() ??
            [];
        imageUrls.forEach((element) {
          log(element.toString());
        });

        log("HALOOOOO");

        emit(DisplayDataOrderCardState(orders: orders, imageUrls: imageUrls));
      } catch (e) {
        log("Something wrong");
        emit(DisplayNoDataOrderCardState());
      }
    });
  }
}
