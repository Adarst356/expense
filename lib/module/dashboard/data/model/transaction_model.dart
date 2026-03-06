class TransactionModel {
  final String id;
  final String title;
  final String category;
  final double amount;
  final String type;
  final DateTime createdAt;

  TransactionModel({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.type,
    required this.createdAt,
  });

  bool get isIncome => type == "income";
  bool get isExpense => type == "expense";

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      amount: (json['amount'] as num).toDouble(),
      type: json['type'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}