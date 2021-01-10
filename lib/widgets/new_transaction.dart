import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget { //widegt reevaluated (data lost)---- data will not be lost in stateful widget
                                                                                    //(but they got lost in sTateless widget)
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .end, //to make the button 'Add Transaction' TO THE right (to the end)
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) =>
                  submitData(), //(_) means I have an argument I dont care about it
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                  decimal: true), //numberWithOptions(decimal: true)
              onSubmitted: (_) =>
                  submitData(), //anonymous function-> dont put parnthesis (just reference)
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed:
                  submitData, //we put refrnce bcz we wanted the function to exute
            )
          ],
        ),
      ),
    );
  }
}
