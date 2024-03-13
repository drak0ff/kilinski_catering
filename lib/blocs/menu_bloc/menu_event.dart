import 'package:equatable/equatable.dart';

sealed class MenuEvent extends Equatable {
  const MenuEvent();

  @override
  List<Object> get props => [];
}

class MenuData extends MenuEvent {
  final String dietName;

  const MenuData({required this.dietName});
}
