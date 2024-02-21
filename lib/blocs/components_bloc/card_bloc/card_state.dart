import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class CardState extends Equatable {
  const CardState();

  @override
  List<Object> get props => [];
}

final class DisplayNoDataCardState extends CardState {}

class DisplayDataCardState extends CardState {
  final List<MealOrder>? orders;

  const DisplayDataCardState({required this.orders});
}
