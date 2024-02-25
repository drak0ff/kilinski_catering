import 'package:equatable/equatable.dart';

sealed class DietCardState extends Equatable {
  const DietCardState();

  @override
  List<Object> get props => [];
}

final class DisplayNoDataDietCardState extends DietCardState {}

class DisplayDataDietCardState extends DietCardState {
  final List<String>? dietsNames;

  const DisplayDataDietCardState({required this.dietsNames});
}
