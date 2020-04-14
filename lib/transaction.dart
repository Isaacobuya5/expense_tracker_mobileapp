import 'package:flutter/foundation.dart';
class Transaction {
  // typical transaction would have have the following
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id, 
    @required this.title, 
    @required this.amount, 
    @required this.date
    });
}