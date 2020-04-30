import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  '\$${transaction.amount.toStringAsFixed(2)}',
                 style: TextStyle(
                   color: Theme.of(context).primaryColor,
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 1.5
                 ),),),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text(transaction.title,
                 style: Theme.of(context).textTheme.title,),
                 Text(DateFormat().format(transaction.date),
                 style: TextStyle(
                   color: Colors.grey
                 ),)
               ]
             ),
             MediaQuery.of(context).size.width > 460 ?
             FlatButton.icon(
               textColor: Theme.of(context).errorColor,
               onPressed: () => deleteTransaction(transaction.id), 
               icon: Icon(Icons.delete), 
               label: Text('Delete')) :
             IconButton(icon: Icon(Icons.delete), 
             color: Theme.of(context).errorColor,
             onPressed: () => deleteTransaction(transaction.id))
           ]
         )
       );
  }
}