import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/new_transactions.dart';
import '../widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

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