import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 

  final List<Transaction> transactions;

  const TransactionList(this.transactions, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height:300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index){
          final tr = transactions[index];
          return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin:const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            )
                          ), //Estiliazção do Contaiter na parte do preço
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'R\$${tr.value.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.orange,//Estilização da fonte 
                            ),
                            ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tr.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize:16,                //Estilização da fonte
                              ),
                            ),
                            Text(
                              DateFormat('d MMM y').format(tr.date),//data formatada no padrão dia mes ano
                              style: const TextStyle(
                                color: Colors.grey,        //Estilização da fonte
                              ),  
                            ),
                          ],
                        )
                      ],
                  )
                );//Foi feito uma para que apareça as informações que faltavam, 
        },
              )
    );
  }
}