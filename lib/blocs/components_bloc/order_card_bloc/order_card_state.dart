import 'package:equatable/equatable.dart';
import 'package:order_repository/order_repository.dart';

sealed class OrderCardState extends Equatable {
  const OrderCardState();

  @override
  List<Object> get props => [];
}

final class DisplayNoDataOrderCardState extends OrderCardState {}

class DisplayDataOrderCardState extends OrderCardState {
  final List<MealOrder>? orders;
  final List<String?> imageUrls;

  const DisplayDataOrderCardState(
      {required this.orders, required this.imageUrls});
}
