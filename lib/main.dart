import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 // list of transactions
 final List<Transaction> transactions = [
   Transaction(id: 't1',title: 'New trouser',amount: 500.00, date: DateTime.now()),
   Transaction(id: 't2',title: 'New shirt',amount: 250.45, date: DateTime.now()),
   Transaction(id: 't3',title: 'New shoes',amount: 850.00, date: DateTime.now())
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker App"),
      ),
      body: Center(
        child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           // chart area
           Container(
             width: double.infinity,
             child: Card(
            color: Colors.blue,
             child: Text('CHART'),
             elevation: 5,
           ),
           ),
        Card(
           child: Container(
             padding: EdgeInsets.all(10.0),
             child:Column(
             crossAxisAlignment: CrossAxisAlignment.end, 
             children: <Widget>[
               TextField(decoration: InputDecoration(
                 labelText: 'Title'
               ),),
               TextField(
                 decoration: InputDecoration(
                   labelText: 'Amount'
                 ),
               
               ),
               FlatButton(
                 onPressed: (){}, 
                 textColor: Colors.purple,
                 child: Text('Add Transaction'))
             ]
           ),
        ),
        ),
        Column(
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
        )
         ],
        ),
      ),
     
    );
  }
}
