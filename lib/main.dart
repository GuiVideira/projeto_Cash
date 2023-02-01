import 'package:flutter/material.dart';
import './components/transaction_user.dart';
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('CashApp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.amber,
                  child: Text('Gráfico'),
                  elevation: 5,
                  ),
              ),
               TransactionUser(),
          ]
        ),
      ),
    );
  }
}