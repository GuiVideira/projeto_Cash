import 'package:cash/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '/components/transaction_form.dart';
import '/components/transaction_list.dart';
import 'models/transaction.dart';
main() => runApp(const CashApp());


class CashApp extends StatelessWidget {
  const CashApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'compra 1',
      value: 150.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't12',
      title: 'Compra 2',
      value: 20.00,
      date: DateTime.now(),
    ),
  ];

  
    _addTransaction(String title, double value) {

      final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value:value,
        date: DateTime.now(),
      );

      setState(() {
        _transactions.add(newTransaction);
      }); 
    }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_) {
        return TransactionForm(_addTransaction);
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('CashApp'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.amber,
                  child: Text('Gráfico'),
                  elevation: 5,
                  ),
              ),
              TransactionList(_transactions),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}