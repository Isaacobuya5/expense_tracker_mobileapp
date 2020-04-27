import 'package:flutter/material.dart';

import './widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand', 
        // set theme to be used by titles in our app
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          button: TextStyle(color: Colors.white),
        ),
        errorColor: Colors.red,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(fontFamily: 'Open Sans', fontSize: 20, fontWeight: FontWeight.bold)
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // Method to start the process for displaying the modal for adding a new transaction
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransaction = [
//  Transaction(id: 't1',title: 'New trouser',amount: 500.00, date: DateTime.now()),
//    Transaction(id: 't2',title: 'New shirt',amount: 250.45, date: DateTime.now()),
//    Transaction(id: 't3',title: 'New shoes',amount: 850.00, date: DateTime.now())
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  // method to add a new transaction
  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTransaction = new Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: chosenDate);

    // we now need to update the transaction list
    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    // This method requires context which we get from the root widget
    // The builder returns the new widget to be displayed in the modal
    // it optional requires context thus we can pass underscore to mean that we do not want to use it
    showModalBottomSheet(context: ctx, builder: (_) {
        return GestureDetector(
          onTap: (){},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),);
    });
  }

  // method for deleting a transaction
  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((transaction) => transaction.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
        title: Text("Expense Tracker App",),
        actions: <Widget>[
           IconButton(icon: Icon(Icons.add, color: Colors.white,), 
           onPressed: () => _startAddNewTransaction(context)
           )
        ],
      );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
     child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           // chart area
           Container(
             height: (MediaQuery.of(context).size.height - appBar.preferredSize.height 
             - MediaQuery.of(context).padding.top) * 0.4,
             width: double.infinity,
             child: Chart(_recentTransactions),
           ),
         Container(
           height: (MediaQuery.of(context).size.height - appBar.preferredSize.height
           - MediaQuery.of(context).padding.top) * 0.6,
           child: TransactionList(transactions: _userTransaction,deleteTransaction: _deleteTransaction)),
         ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>_startAddNewTransaction(context),
        child: Icon(Icons.add),
      )
    );
  }
}
