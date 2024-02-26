import 'package:equatable/equatable.dart';

sealed class DietCardEvent extends Equatable {
  const DietCardEvent();

  @override
  List<Object?> get props => [];
}

class DisplayDietCard extends DietCardEvent {}
