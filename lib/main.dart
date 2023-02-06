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
    return  MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        )
        .copyWith(
          secondary: Colors.green,
        ),//aqui foi posto um esquema de cores, uma cor principal e uma secundária que muda as cores de forma geral e o botão floatingActionButton respectivamente.
        fontFamily: 'RobotoMono',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily:'Lora',fontSize:20, 
          ),
        ),
      ),
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
      //Navigator.of serve para fechar o modal(formulario), aplicação stateless
      Navigator.of(context).pop();
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:const Text('CashApp'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
               SizedBox(
                width: double.infinity,
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  elevation: 5,
                  child: const Text('Gráfico'),
                  ),
              ),
              TransactionList(_transactions),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}