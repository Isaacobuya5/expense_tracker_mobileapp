import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

final titleController = TextEditingController();
final amountController = TextEditingController();

  void submitData() {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // do not submit if no title or amount has been entered
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

     addNewTransaction(enteredTitle, enteredAmount);
   }

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
               ),
              onSubmitted: (_) => submitData(),

               ),
               TextField(
                 controller: amountController,
                 decoration: InputDecoration(
                   labelText: 'Amount'
                 ),
              keyboardType: TextInputType.number, 
              onSubmitted: (_) => submitData(),
               ),
               FlatButton(
                 onPressed: submitData, 
                 textColor: Colors.purple,
                 child: Text('Add Transaction'))
             ]
           ),
        ),
        );
  }



}