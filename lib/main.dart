import 'package:flutter/material.dart';
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
        Column(
          children: transactions.map((transaction) {
            return Card(
              child: Text(transaction.title)
            );
          }).toList()
        )
         ],
        ),
      ),
     
    );
  }
}
