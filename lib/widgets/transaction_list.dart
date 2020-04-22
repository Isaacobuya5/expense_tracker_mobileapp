import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 300,
    child: ListView.builder(
          itemBuilder: (context, index) {
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
                      border: Border.all(width: 2, 
                      color: Theme.of(context).primaryColor, 
                      style: BorderStyle.solid)
                    ),
                    child: Text(
                       '\$${transactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5
                      ),),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(transactions[index].title,
                      style: Theme.of(context).textTheme.title,),
                      Text(DateFormat().format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey
                      ),)
                    ]
                  )
                ]
              )
            );
          },
          itemCount: transactions.length,
        )
    );
  }
}