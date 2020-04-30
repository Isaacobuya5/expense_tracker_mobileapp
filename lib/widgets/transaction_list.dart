import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  Function deleteTransaction;

  TransactionList({this.transactions, this.deleteTransaction});

  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 450,
    child: transactions.isEmpty ? LayoutBuilder(
      builder: (context, constraint) {
        return Column(
        children: <Widget>[
          Text('No transactions currently available', style:
          Theme.of(context).textTheme.title,),
          // SizedBox are a great way to add separators since its not a must to define child for them
          SizedBox(
            height: 20,
          ),
          Container(
            height: constraint.maxHeight * 0.6,
            child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
        ],
      );
      },
     
    ) : ListView.builder(
          itemBuilder: (context, index) {
         return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
          },
          itemCount: transactions.length,
        )
    );
  }
}

