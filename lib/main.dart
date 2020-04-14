import 'package:flutter/material.dart';

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
           Card(
             color: Colors.red,
             child: Text('LIST OF TX'),)
         ],
        ),
      ),
     
    );
  }
}
