import 'package:order_repository/order_repository.dart';

abstract class AbstractOrderRepo {
  Future<List<MealOrder>?> getOrders(String? userId);
}
