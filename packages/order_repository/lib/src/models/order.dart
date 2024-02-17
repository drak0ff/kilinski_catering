import 'package:equatable/equatable.dart';

enum Status { pending, paid, inProgress, completeds }

class Order extends Equatable {
  final String? orderId;
  final String? userId;
  final String? dietId;
  final Status? status;
  final DateTime? timeStamp;
  final DateTime? days;
}
