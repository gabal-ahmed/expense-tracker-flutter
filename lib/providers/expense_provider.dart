/// Expense Provider - State Management
/// Role: State Management Specialist 🔧
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/expense_model.dart';
import '../services/database_service.dart';
import '../constants/categories.dart';

class ExpenseProvider with ChangeNotifier {
  final DatabaseService _db = DatabaseService.instance;
  final Uuid _uuid = const Uuid();

  List<Expense> _expenses = [];
  String _selectedCategory = Categories.all;
  bool _isLoading = false;

  // Getters
  List<Expense> get expenses => _expenses;
  String get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;

  // Get filtered expenses based on selected category
  List<Expense> get filteredExpenses {
    if (_selectedCategory == Categories.all) {
      return _expenses;
    }
    return _expenses
        .where((expense) => expense.category == _selectedCategory)
        .toList();
  }

  // Load all expenses from database
  Future<void> loadExpenses() async {
    _isLoading = true;
    notifyListeners();

    try {
      _expenses = await _db.getAllExpenses();
    } catch (e) {
      debugPrint('Error loading expenses: $e');
      _expenses = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add new expense
  Future<void> addExpense({
    required String title,
    required double amount,
    required String category,
    required DateTime date,
    String? description,
  }) async {
    final expense = Expense(
      id: _uuid.v4(),
      title: title,
      amount: amount,
      category: category,
      date: date,
      description: description,
    );

    try {
      await _db.insertExpense(expense);
      _expenses.insert(0, expense); // Add to beginning (newest first)
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding expense: $e');
      rethrow;
    }
  }

  // Delete expense
  Future<void> deleteExpense(String id) async {
    try {
      await _db.deleteExpense(id);
      _expenses.removeWhere((expense) => expense.id == id);
      notifyListeners();
    } catch (e) {
      debugPrint('Error deleting expense: $e');
      rethrow;
    }
  }

  // Update expense
  Future<void> updateExpense(Expense expense) async {
    try {
      await _db.updateExpense(expense);
      final index = _expenses.indexWhere((e) => e.id == expense.id);
      if (index != -1) {
        _expenses[index] = expense;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error updating expense: $e');
      rethrow;
    }
  }

  // Set category filter
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Get total expense for all expenses
  double get totalExpense {
    return _expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get total expense for filtered expenses
  double get filteredTotalExpense {
    return filteredExpenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get total expense by category
  double getTotalByCategory(String category) {
    return _expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get today's expenses
  List<Expense> getTodayExpenses() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    return _expenses.where((expense) {
      return expense.date.isAfter(today) && expense.date.isBefore(tomorrow);
    }).toList();
  }

  // Get this week's expenses
  List<Expense> getWeekExpenses() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);

    return _expenses.where((expense) {
      return expense.date.isAfter(startDate);
    }).toList();
  }

  // Get this month's expenses
  List<Expense> getMonthExpenses() {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);

    return _expenses.where((expense) {
      return expense.date.isAfter(startOfMonth);
    }).toList();
  }

  // Get total for today
  double get todayTotal {
    return getTodayExpenses().fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get total for this week
  double get weekTotal {
    return getWeekExpenses().fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get total for this month
  double get monthTotal {
    return getMonthExpenses().fold(0.0, (sum, expense) => sum + expense.amount);
  }

  // Get expenses count by category
  Map<String, int> getExpenseCountByCategory() {
    final Map<String, int> counts = {};
    for (var category in Categories.allCategories) {
      counts[category] = _expenses
          .where((expense) => expense.category == category)
          .length;
    }
    return counts;
  }

  // Get amount by category
  Map<String, double> getAmountByCategory() {
    final Map<String, double> amounts = {};
    for (var category in Categories.allCategories) {
      amounts[category] = getTotalByCategory(category);
    }
    return amounts;
  }
}
