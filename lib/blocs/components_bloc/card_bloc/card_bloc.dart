import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_event.dart';
import 'package:happy_catering/blocs/components_bloc/card_bloc/card_state.dart';
import 'package:order_repository/order_repository.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final OrderRepository _orderRepository;

  CardBloc({required OrderRepository orderRepository})
      : _orderRepository = orderRepository,
        super(DisplayNoDataCardState()) {
    on<DisplayMealOrder>((event, emit) async {
      try {
        final orders = await _orderRepository
            .getOrders(FirebaseAuth.instance.currentUser?.uid);
        emit(DisplayDataCardState(orders: orders));
        log("This is not bulsht");
      } catch (e) {
        log("Something wrong");
        emit(DisplayNoDataCardState());
      }
    });
  }
}
