class Transaction {
  final String id;
  late String title;
  late double value;
  final DateTime date;

  Transaction(
      {required this.id,
      required this.title,
      required this.value,
      required this.date});
}
