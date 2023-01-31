
/*Classe de modelo que represa uma transação
*/
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
 
 /*Criação de um construtor com todos os atributos requeridos com o decoretor "required"
*/
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}