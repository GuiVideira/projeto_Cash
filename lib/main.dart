import 'package:flutter/material.dart';
import 'dart:math';
import '/components/transaction_form.dart';
import '/components/transaction_list.dart';
import '/components/chart.dart';
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
          primarySwatch: Colors.green,
        )
        .copyWith(
          secondary: Colors.black,
        ),//aqui foi posto um esquema de cores, uma cor principal e uma secundária que muda as cores de forma geral e o botão floatingActionButton respectivamente.
        fontFamily: 'RobotoMono',
        textTheme: ThemeData.light().textTheme.copyWith(
          headline6: const TextStyle(
            fontFamily: 'Lora',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          button: const TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
          ),
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

  final List <Transaction>_transactions = [
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

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }
  
    _addTransaction(String title, double value, DateTime date) {
      final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value:value,
        date: date,
      );

      setState(() {
        _transactions.add(newTransaction);
      }); 
      //Navigator.of serve para fechar o modal(formulario), aplicação stateless
      Navigator.of(context).pop();
    }

  _removeTransaction(String id) {
    setState((){
      _transactions.removeWhere((tr) => tr.id == id);
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
    final appBar = AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'CashApp',
          style: TextStyle(
            fontSize:  20 * MediaQuery.of(context).textScaleFactor,
          ),
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      );
    final availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;


    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
               Container(
                height: availableHeight * 0.3,
                child: Chart(_recentTransactions)
               ),
              Container(
                height: availableHeight * 0.7,
                child: TransactionList(_transactions, _removeTransaction)
                ),
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