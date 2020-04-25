import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
final _titleController = TextEditingController();

final _amountController = TextEditingController();
DateTime _selectedDate;

  void _submitData() {

    if (_amountController.text.isEmpty == null) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // do not submit if no title or amount has been entered
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

     widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
   }

   void _showDatePicker() {
     showDatePicker(
       context: context, 
       initialDate: DateTime.now(), 
       firstDate: DateTime(2020), 
       lastDate: DateTime.now())
       .then((pickedDate) {
         if (pickedDate == null) {
           return;
         }
         setState(() {
         _selectedDate = pickedDate;
       });
       });
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
                 controller: _titleController,
                 decoration: InputDecoration(
                 labelText: 'Title'
               ),
              onSubmitted: (_) => _submitData(),

               ),
               TextField(
                 controller: _amountController,
                 decoration: InputDecoration(
                   labelText: 'Amount'
                 ),
              keyboardType: TextInputType.number, 
              onSubmitted: (_) => _submitData(),
               ),
               Container(
                 height: 70,
                 child: Row(
                   children: <Widget> [
                       Expanded(
                          child: Text(_selectedDate == null ? "No date chosen!" :
                         'Picked date: ${DateFormat.yMd().format(_selectedDate)}'),
                       ),
                       FlatButton(
                         onPressed: _showDatePicker, 
                         textColor: Theme.of(context).primaryColor,
                         child: Text("Choose date here", style: TextStyle(
                           fontWeight: FontWeight.bold
                         ),
                         )
                       )
                   ]
                 ),
               ),
               RaisedButton(
                 onPressed: _submitData, 
                 color: Theme.of(context).primaryColor,
                 textColor: Theme.of(context).textTheme.button.color,
                 child: Text('Add Transaction'))
             ]
           ),
        ),
        );
  }
}