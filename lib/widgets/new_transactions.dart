import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

final titleController = TextEditingController();
final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
           child: Container(
             padding: EdgeInsets.all(10.0),
             child:Column(
             crossAxisAlignment: CrossAxisAlignment.end, 
             children: <Widget>[
               TextField(
                 controller: titleController,
                 decoration: InputDecoration(
                 labelText: 'Title'
               ),),
               TextField(
                 controller: amountController,
                 decoration: InputDecoration(
                   labelText: 'Amount'
                 ),
               
               ),
               FlatButton(
                 onPressed: (){
                   addNewTransaction(titleController.text, double.parse(amountController.text));
                 }, 
                 textColor: Colors.purple,
                 child: Text('Add Transaction'))
             ]
           ),
        ),
        );
  }
}