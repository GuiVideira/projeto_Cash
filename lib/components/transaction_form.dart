import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _valueController = TextEditingController();
    DateTime? _selectedDate = DateTime.now();

  _submitForm () {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    
    if(title.isEmpty || value <= 0 ||  _selectedDate == null){
      return;
    }
    
    widget.onSubmit(title, value, _selectedDate!);
                          
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null){
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
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children:  <Widget>[
                       TextField(
                        controller: _titleController,
                        onSubmitted: (_) => _submitForm(),
                        decoration: const InputDecoration(
                          labelText: 'Título',
                        ),
                      ),
                       TextField(
                        controller: _valueController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(
                          labelText: 'Valor(R\$)',
                        ),
                      ),
                     Container(
                      height:70,
                       child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _selectedDate == null ?'Nenhuma data selecionada!'
                              :'Data Selecioanda: ${DateFormat('d/M/y').format(_selectedDate!)}' 
                              ),
                          ),
                          TextButton(
                            child: Text('Selecionar Data'),
                            onPressed: _showDatePicker, )
                        ],
                       ),
                     ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Theme.of(context).primaryColor,
                          ),
                          onPressed: _submitForm,
                          child: const Text('Nova Transação'),
                          ),
                       ],
                     )
                    ]
                  ),
                ),
              );
  }
}