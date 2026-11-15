/// Category Filter Widget
/// Role: Frontend Developer 💻 + UI/UX Designer 🎨
import 'package:flutter/material.dart';
import '../constants/categories.dart';
import '../constants/app_theme.dart';

class CategoryFilter extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [Categories.all, ...Categories.allCategories];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingMedium),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          final isAll = category == Categories.all;

          return Padding(
            padding: const EdgeInsets.only(right: AppTheme.paddingSmall),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!isAll) ...[
                    Icon(
                      Categories.getCategoryIcon(category),
                      size: 18,
                      color: isSelected
                          ? Colors.white
                          : Categories.getCategoryColor(category),
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(category),
                ],
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onCategorySelected(category);
                }
              },
              backgroundColor: Colors.white,
              selectedColor: isAll
                  ? AppTheme.primaryPurple
                  : Categories.getCategoryColor(category),
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textPrimary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
              checkmarkColor: Colors.white,
              elevation: isSelected ? 4 : 1,
              shadowColor: isSelected
                  ? (isAll
                      ? AppTheme.primaryPurple
                      : Categories.getCategoryColor(category))
                  : Colors.black12,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? Colors.transparent
                      : const Color(0xFFE0E0E0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
