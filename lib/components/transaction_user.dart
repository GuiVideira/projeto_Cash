import 'dart:math';

import 'package:flutter/material.dart';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
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



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionForm(_addTransaction), 
        TransactionList(_transactions),
      ],
    );
  }
}