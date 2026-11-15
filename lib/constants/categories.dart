/// Category Constants & Configuration
/// Role: UI/UX Designer 🎨 + Software Architect 🏗️
import 'package:flutter/material.dart';
import 'app_theme.dart';

class ExpenseCategory {
  final String name;
  final IconData icon;
  final Color color;

  const ExpenseCategory({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class Categories {
  static const String all = 'All';
  static const String food = 'Food';
  static const String transport = 'Transport';
  static const String shopping = 'Shopping';
  static const String bills = 'Bills';
  static const String other = 'Other';

  // Category configurations with icons and colors
  static const Map<String, ExpenseCategory> categoryConfig = {
    food: ExpenseCategory(
      name: food,
      icon: Icons.restaurant,
      color: AppTheme.foodOrange,
    ),
    transport: ExpenseCategory(
      name: transport,
      icon: Icons.directions_car,
      color: AppTheme.transportBlue,
    ),
    shopping: ExpenseCategory(
      name: shopping,
      icon: Icons.shopping_bag,
      color: AppTheme.shoppingPink,
    ),
    bills: ExpenseCategory(
      name: bills,
      icon: Icons.receipt_long,
      color: AppTheme.billsRed,
    ),
    other: ExpenseCategory(
      name: other,
      icon: Icons.more_horiz,
      color: AppTheme.otherGrey,
    ),
  };

  // Get list of all categories for dropdown/filter
  static List<String> get allCategories => [
    food,
    transport,
    shopping,
    bills,
    other,
  ];

  // Get category configuration
  static ExpenseCategory getCategory(String categoryName) {
    return categoryConfig[categoryName] ?? categoryConfig[other]!;
  }

  // Get category color
  static Color getCategoryColor(String categoryName) {
    return categoryConfig[categoryName]?.color ?? AppTheme.otherGrey;
  }

  // Get category icon
  static IconData getCategoryIcon(String categoryName) {
    return categoryConfig[categoryName]?.icon ?? Icons.more_horiz;
  }
}
