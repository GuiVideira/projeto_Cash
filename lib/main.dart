import 'package:flutter/material.dart';
import 'components/transaction_form.dart';
import 'models/transaction.dart';
import './components/transaction_list.dart';
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

//Uma lista para ter alguns dados exibidos no começo, por isso o final, não será alterada, por enquanto 
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Titulo'),
      ),
      body: Column(
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
            const TransactionForm(),
        ]
      ),
    );
  }
}