import 'package:equatable/equatable.dart';

sealed class CardEvent extends Equatable {
  const CardEvent();

  @override
  List<Object?> get props => [];
}

class DisplayMealOrder extends CardEvent {}
