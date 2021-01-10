import 'package:flutter/foundation.dart'; //to use @required

class Transaction {
  final String id;
  final String title;
  final double amount;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.amount,
    @required this.date,
    @required this.title,
  });
}
