import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: transactions.map((transaction) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20
                    ),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.purple, style: BorderStyle.solid)
                    ),
                    child: Text(
                       '\$${transaction.amount}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transaction.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(DateFormat().format(transaction.date),
                      style: TextStyle(
                        color: Colors.grey
                      ),)
                    ]
                  )
                ]
              )
            );
          }).toList()
        );
  }
}