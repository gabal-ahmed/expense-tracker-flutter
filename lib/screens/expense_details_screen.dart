/// Expense Details Screen - Full Details View
/// Role: Frontend Developer 💻 + UI/UX Designer 🎨
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense_model.dart';
import '../constants/categories.dart';
import '../constants/app_theme.dart';
import 'edit_expense_screen.dart';

class ExpenseDetailsScreen extends StatelessWidget {
  final Expense expense;

  const ExpenseDetailsScreen({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    final category = Categories.getCategory(expense.category);
    final formattedDate = DateFormat('EEEE, MMMM dd, yyyy').format(expense.date);
    final formattedTime = DateFormat('hh:mm a').format(expense.date);
    final formattedAmount = '\$${expense.amount.toStringAsFixed(2)}';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Details'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditExpenseScreen(expense: expense),
                ),
              );
            },
            tooltip: 'Edit Expense',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with Amount
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.paddingLarge * 2),
              decoration: const BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      category.icon,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    formattedAmount,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      expense.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.paddingLarge),

            // Details Cards
            Padding(
              padding: const EdgeInsets.all(AppTheme.paddingMedium),
              child: Column(
                children: [
                  // Title Card
                  _buildDetailCard(
                    icon: Icons.receipt_long,
                    iconColor: AppTheme.primaryPurple,
                    title: 'Title',
                    value: expense.title,
                  ),

                  const SizedBox(height: AppTheme.paddingMedium),

                  // Date Card
                  _buildDetailCard(
                    icon: Icons.calendar_today,
                    iconColor: AppTheme.transportBlue,
                    title: 'Date',
                    value: formattedDate,
                    subtitle: formattedTime,
                  ),

                  const SizedBox(height: AppTheme.paddingMedium),

                  // Category Card
                  _buildDetailCard(
                    icon: Icons.category,
                    iconColor: category.color,
                    title: 'Category',
                    value: expense.category,
                    subtitle: 'Spending category',
                  ),

                  const SizedBox(height: AppTheme.paddingMedium),

                  // Amount Card
                  _buildDetailCard(
                    icon: Icons.attach_money,
                    iconColor: AppTheme.success,
                    title: 'Amount',
                    value: formattedAmount,
                    subtitle: 'Total expense',
                  ),

                  if (expense.description != null && expense.description!.isNotEmpty) ...[
                    const SizedBox(height: AppTheme.paddingMedium),
                    // Description Card
                    _buildDetailCard(
                      icon: Icons.notes,
                      iconColor: AppTheme.secondaryPink,
                      title: 'Description',
                      value: expense.description!,
                      isDescription: true,
                    ),
                  ],

                  const SizedBox(height: AppTheme.paddingMedium),

                  // ID Card (for reference)
                  _buildDetailCard(
                    icon: Icons.fingerprint,
                    iconColor: AppTheme.otherGrey,
                    title: 'Expense ID',
                    value: '${expense.id.substring(0, 13)}...',
                    subtitle: 'Unique identifier',
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.paddingLarge),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.paddingLarge,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditExpenseScreen(expense: expense),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: AppTheme.primaryPurple),
                        foregroundColor: AppTheme.primaryPurple,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.paddingMedium),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Back'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.paddingLarge),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
    String? subtitle,
    bool isDescription = false,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: AppTheme.paddingMedium),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.cardSubtitleStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: AppTheme.cardTitleStyle.copyWith(
                      fontSize: isDescription ? 14 : 16,
                    ),
                    maxLines: isDescription ? 10 : 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTheme.cardSubtitleStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
