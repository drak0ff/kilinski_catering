import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class OrderCardState extends Equatable {
  const OrderCardState();

  @override
  List<Object> get props => [];
}

class DisplayNoDataOrderCardState extends OrderCardState {
  final String message;

  const DisplayNoDataOrderCardState(
      {this.message = 'No data available right now'});
}

class DisplayDataOrderCardState extends OrderCardState {
  final List<MealOrder>? orders;

  const DisplayDataOrderCardState({required this.orders});
}
