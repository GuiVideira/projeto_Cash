import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
 TextEditingController titleController = TextEditingController();

 TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:  <Widget>[
                       TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                       TextField(
                        controller: valueController,
                        decoration: InputDecoration(
                          labelText: 'Valor(R\$)',
                        ),
                      ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         TextButton(
                          style: TextButton.styleFrom(foregroundColor: Colors.orange),
                          child: const Text('Nova Transação'),
                          onPressed: () {
                            print(titleController.text);
                            print(valueController.text);
                          },
                          ),
                       ],
                     )
                    ]
                  ),
                ),
              );
  }
}