import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:order_repository/order_repository.dart';

class OrderRepository implements AbstractOrderRepo {
  final FirebaseFirestore _firestore;

  OrderRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<MealOrder>?> getOrders(String? userId) async {
    try {
      final querySnapshot = await _firestore
          .collection('orders')
          .withConverter(
              fromFirestore: MealOrder.FromFirestore,
              toFirestore: (MealOrder order, _) => order.ToFirestore())
          .where('UserId', isEqualTo: userId)
          .get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      log("Error getting orders: $e");
      return null;
    }
  }
}
