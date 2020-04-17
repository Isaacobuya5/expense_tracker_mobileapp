import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransaction = [
 Transaction(id: 't1',title: 'New trouser',amount: 500.00, date: DateTime.now()),
   Transaction(id: 't2',title: 'New shirt',amount: 250.45, date: DateTime.now()),
   Transaction(id: 't3',title: 'New shoes',amount: 850.00, date: DateTime.now())
  ];

  // method to add a new transaction
  void _addNewTransaction(String title, double amount) {
    final newTransaction = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());

    // we now need to update the transaction list
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
               NewTransaction(_addNewTransaction),
               TransactionList(transactions: _userTransaction,)
      ]
    );
  }
}