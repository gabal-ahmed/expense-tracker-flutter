/// Statistics Screen (P2 - Nice to Have)
/// Role: Frontend Developer 💻 + UI/UX Designer 🎨
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/stat_card.dart';
import '../constants/categories.dart';
import '../constants/app_theme.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        centerTitle: true,
      ),
      body: Consumer<ExpenseProvider>(
        builder: (context, provider, child) {
          if (provider.expenses.isEmpty) {
            return _buildEmptyState();
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Time Period',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                
                // Time period cards
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        title: 'Today',
                        amount: '\$${provider.todayTotal.toStringAsFixed(2)}',
                        icon: Icons.today,
                        color: AppTheme.primaryPurple,
                      ),
                    ),
                    const SizedBox(width: AppTheme.paddingMedium),
                    Expanded(
                      child: StatCard(
                        title: 'Week',
                        amount: '\$${provider.weekTotal.toStringAsFixed(2)}',
                        icon: Icons.calendar_view_week,
                        color: AppTheme.transportBlue,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppTheme.paddingMedium),
                
                StatCard(
                  title: 'Month',
                  amount: '\$${provider.monthTotal.toStringAsFixed(2)}',
                  icon: Icons.calendar_month,
                  color: AppTheme.secondaryPink,
                ),
                
                const SizedBox(height: AppTheme.paddingLarge),
                
                const Text(
                  'By Category',
                  style: AppTheme.headingStyle,
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                
                // Category breakdown
                ...Categories.allCategories.map((category) {
                  final total = provider.getTotalByCategory(category);
                  final count = provider.getExpenseCountByCategory()[category] ?? 0;
                  
                  if (total == 0) return const SizedBox.shrink();
                  
                  return Card(
                    margin: const EdgeInsets.only(bottom: AppTheme.paddingMedium),
                    child: ListTile(
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Categories.getCategoryColor(category).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
                        ),
                        child: Icon(
                          Categories.getCategoryIcon(category),
                          color: Categories.getCategoryColor(category),
                        ),
                      ),
                      title: Text(
                        category,
                        style: AppTheme.cardTitleStyle,
                      ),
                      subtitle: Text(
                        '$count transaction${count > 1 ? 's' : ''}',
                        style: AppTheme.cardSubtitleStyle,
                      ),
                      trailing: Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Categories.getCategoryColor(category),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart_outlined,
            size: 100,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'No data to display',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add some expenses to see statistics',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
