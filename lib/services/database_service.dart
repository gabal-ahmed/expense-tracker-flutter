/// Database Service for SQLite Operations
/// Role: Database Engineer 🗄️
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/expense_model.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._init();
  static Database? _database;

  DatabaseService._init();

  // Singleton pattern - get database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('expenses.db');
    return _database!;
  }

  // Initialize database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Create database tables
  Future<void> _createDB(Database db, int version) async {
    const idType = 'TEXT PRIMARY KEY';
    const textType = 'TEXT NOT NULL';
    const realType = 'REAL NOT NULL';

    await db.execute('''
      CREATE TABLE expenses (
        id $idType,
        title $textType,
        amount $realType,
        category $textType,
        date $textType,
        description TEXT
      )
    ''');
  }

  // CREATE: Insert new expense
  Future<void> insertExpense(Expense expense) async {
    final db = await instance.database;
    
    try {
      await db.insert(
        'expenses',
        expense.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw Exception('Failed to insert expense: $e');
    }
  }

  // READ: Get all expenses
  Future<List<Expense>> getAllExpenses() async {
    final db = await instance.database;
    
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'expenses',
        orderBy: 'date DESC',
      );

      return List.generate(maps.length, (i) {
        return Expense.fromMap(maps[i]);
      });
    } catch (e) {
      throw Exception('Failed to get expenses: $e');
    }
  }

  // READ: Get expenses by category
  Future<List<Expense>> getExpensesByCategory(String category) async {
    final db = await instance.database;
    
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'expenses',
        where: 'category = ?',
        whereArgs: [category],
        orderBy: 'date DESC',
      );

      return List.generate(maps.length, (i) {
        return Expense.fromMap(maps[i]);
      });
    } catch (e) {
      throw Exception('Failed to get expenses by category: $e');
    }
  }

  // READ: Get expenses by date range
  Future<List<Expense>> getExpensesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final db = await instance.database;
    
    try {
      final List<Map<String, dynamic>> maps = await db.query(
        'expenses',
        where: 'date BETWEEN ? AND ?',
        whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
        orderBy: 'date DESC',
      );

      return List.generate(maps.length, (i) {
        return Expense.fromMap(maps[i]);
      });
    } catch (e) {
      throw Exception('Failed to get expenses by date range: $e');
    }
  }

  // UPDATE: Update existing expense
  Future<void> updateExpense(Expense expense) async {
    final db = await instance.database;
    
    try {
      await db.update(
        'expenses',
        expense.toMap(),
        where: 'id = ?',
        whereArgs: [expense.id],
      );
    } catch (e) {
      throw Exception('Failed to update expense: $e');
    }
  }

  // DELETE: Delete expense by id
  Future<void> deleteExpense(String id) async {
    final db = await instance.database;
    
    try {
      await db.delete(
        'expenses',
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      throw Exception('Failed to delete expense: $e');
    }
  }

  // DELETE: Delete all expenses (for testing/reset)
  Future<void> deleteAllExpenses() async {
    final db = await instance.database;
    
    try {
      await db.delete('expenses');
    } catch (e) {
      throw Exception('Failed to delete all expenses: $e');
    }
  }

  // Close database connection
  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
