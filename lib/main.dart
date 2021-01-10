import 'package:expenses_calculator/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,

        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans', 
            fontSize: 18, 
            fontWeight: FontWeight.bold
          ),
        ),
        
        appBarTheme: AppBarTheme(
          color: Colors.cyan, 
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        fontFamily: 'Quicksand',
      ),
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final List<Transaction> _userTransactions = [
    Transaction(
      amount: 69.99,
      title: 'New Shoes',
      id: 't1',
      date: DateTime.now(),
    ),
    Transaction(
        title: 'Weekly Groceries',
        id: 't2',
        date: DateTime.now(),
        amount: 157.22),
    Transaction(
      amount: 69.99,
      title: 'New clothes',
      id: 't3',
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      amount: 22.2,
      title: 'Food',
      id: 't4',
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      amount: 69.99,
      title: 'Transportation',
      id: 't5',
      date: DateTime.now().subtract(Duration(days:5)),
    ),
    Transaction(
      amount: 19,
      title: 'Sweet',
      id: 't6',
      date: DateTime.now().subtract(Duration(days: 1)),
    ),
    Transaction(
      amount: 200,
      title: 'Rent',
      id: 't5',
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
   ];

  List <Transaction> get _recentTransactions{
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7)
        )
      );
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      amount: txAmount,
      title: txTitle,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx); //it visualizes synchronously on the app
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Container(
              //   width: double.infinity,
              //   child: Card(
              //     color: Theme.of(context).primaryColor,
              //     child: Text('CHART!'),
              //     elevation: 5,
              //   ),
              // ),
              Chart(_recentTransactions),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
