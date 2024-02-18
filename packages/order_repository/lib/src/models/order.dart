import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

enum Status { pending, paid, inProgress, completed }

class MealOrder extends Equatable {
  final String? orderId;
  final String? userId;
  final String? dietId;
  final Status? status;
  final DateTime? timeStamp;
  final int? days;
  final List<String>? mealsId;

  @override
  List<Object?> get props =>
      [orderId, userId, dietId, status, timeStamp, days, mealsId];

  const MealOrder(
      {required this.orderId,
      required this.userId,
      required this.dietId,
      required this.status,
      required this.timeStamp,
      required this.days,
      required this.mealsId});

  factory MealOrder.FromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? option,
  ) {
    final data = snapshot.data();
    final timeStampData = data?['Timestamp'];
    return MealOrder(
        orderId: data?['OrderId'],
        userId: data?['UserId'],
        dietId: data?['DataId'],
        status: (() {
          switch (data?['Status']) {
            case 'pending':
              return Status.paid;
            case 'paid':
              return Status.paid;
            case 'inProgress':
              return Status.inProgress;
            case 'completed':
              return Status.completed;
          }
        })(),
        timeStamp: timeStampData != null ? timeStampData.toDate() : null,
        days: data?['Days'],
        mealsId: List<String>.from(data?['Meals']));
  }

  Map<String, dynamic> ToFirestore() {
    return {
      if (orderId != null) "orderId": orderId,
      if (userId != null) "userId": userId,
      if (dietId != null) "dietId": dietId,
      if (status != null) "status": status,
      if (timeStamp != null) "timeStamp": timeStamp,
      if (days != null) "days": days,
      if (mealsId != null) "mealsId": mealsId,
    };
  }
}
