import 'package:equatable/equatable.dart';

sealed class OrderCardEvent extends Equatable {
  const OrderCardEvent();

  @override
  List<Object?> get props => [];
}

class DisplayMealOrderCard extends OrderCardEvent {}
