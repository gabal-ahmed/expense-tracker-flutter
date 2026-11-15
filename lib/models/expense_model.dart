/// Data Model for Expense
/// Role: Software Architect 🏗️ + Database Engineer 🗄️
class Expense {
  final String id;           // UUID
  final String title;        // Required
  final double amount;       // Required, positive number
  final String category;     // Food, Transport, Shopping, Bills, Other
  final DateTime date;       // Date of expense
  final String? description; // Optional

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.description,
  });

  // Convert Expense to Map for database insertion
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category,
      'date': date.toIso8601String(),
      'description': description,
    };
  }

  // Create Expense from Map (database query result)
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      category: map['category'] as String,
      date: DateTime.parse(map['date'] as String),
      description: map['description'] as String?,
    );
  }

  // Create a copy of Expense with modified fields
  Expense copyWith({
    String? id,
    String? title,
    double? amount,
    String? category,
    DateTime? date,
    String? description,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      date: date ?? this.date,
      description: description ?? this.description,
    );
  }
}
