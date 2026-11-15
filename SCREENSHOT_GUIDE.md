# 📸 Screenshot Guide - Expense Tracker App

## 🎯 All Screens to Capture

### **Total Screens:** 5 Main Screens + Multiple States

---

## 📱 SCREEN 1: Home Screen (Empty State)

**File:** `home_screen.dart`

**What to show:**
- Empty expense list
- Gradient header with $0.00 total
- "No expenses yet" message
- Category filter chips (All selected)
- Floating Action Button (+ Add Expense)
- Statistics icon in header

**How to capture:**
1. Open app for the first time (or delete all expenses)
2. Home screen appears with empty state
3. **Screenshot 1: Empty Home Screen**

**Key elements visible:**
- ✅ Purple gradient header
- ✅ "Expense Tracker" title
- ✅ Statistics bar chart icon
- ✅ "0 items" badge
- ✅ Total: $0.00
- ✅ Category filter (All, Food, Transport, Shopping, Bills, Other)
- ✅ Empty state icon and message
- ✅ "+ Add Expense" FAB

---

## 📱 SCREEN 2: Add Expense Screen

**File:** `add_expense_screen.dart`

**What to show:**
- Form with all fields empty
- Then form with sample data filled in

**How to capture:**
1. Tap the "+ Add Expense" button
2. **Screenshot 2A: Empty Add Form**
3. Fill in sample data:
   - Title: "Lunch at Restaurant"
   - Amount: "45.50"
   - Category: "Food"
   - Date: Today's date
   - Description: "Delicious pizza with friends"
4. **Screenshot 2B: Filled Add Form**

**Key elements visible:**
- ✅ "Add Expense" title in app bar
- ✅ Title field with icon
- ✅ Amount field with $ icon
- ✅ Category dropdown with icons
- ✅ Date picker
- ✅ Description field (3 lines)
- ✅ "Save Expense" button
- ✅ "Cancel" button

---

## 📱 SCREEN 3: Home Screen (With Expenses)

**File:** `home_screen.dart`

**What to show:**
- Multiple expenses in the list
- Updated total in header
- Category filter active

**How to capture:**
1. After adding 3-5 expenses, return to home
2. **Screenshot 3A: Home with Multiple Expenses**
3. Tap a category filter (e.g., "Food")
4. **Screenshot 3B: Home with Category Filter Active**

**Sample expenses to add:**
1. Lunch - $45.50 - Food - "Pizza with friends"
2. Gas - $35.00 - Transport - "Fill up tank"
3. New Shoes - $89.99 - Shopping - "Nike Air Max"
4. Coffee - $5.50 - Food - "Morning latte"
5. Uber Ride - $18.00 - Transport - "Trip downtown"

**Key elements visible:**
- ✅ Updated total (e.g., $193.99)
- ✅ Item count (e.g., "5 items")
- ✅ Expense cards with:
  - Category icon with colored background
  - Title and description
  - Date and category
  - Amount in category color
- ✅ Category filter chips
- ✅ Statistics icon

---

## 📱 SCREEN 4: Expense Details Screen

**File:** `expense_details_screen.dart`

**What to show:**
- Full details of a selected expense
- All information cards

**How to capture:**
1. Tap on any expense card (e.g., "Lunch at Restaurant")
2. Details screen opens
3. **Screenshot 4: Expense Details**

**Key elements visible:**
- ✅ "Expense Details" title
- ✅ Edit icon in app bar
- ✅ Gradient header with:
  - Large category icon in circle
  - Big amount display ($45.50)
  - Category badge ("Food")
- ✅ Detail cards:
  - Title card with receipt icon
  - Date card with calendar icon (shows full day name + time)
  - Category card with category icon
  - Amount card with dollar icon
  - Description card with notes icon
  - ID card with fingerprint icon
- ✅ "Edit" and "Back" buttons at bottom

---

## 📱 SCREEN 5: Edit Expense Screen

**File:** `edit_expense_screen.dart`

**What to show:**
- Edit form with pre-filled data
- Info banner showing what you're editing

**How to capture:**
1. From Details screen, tap Edit icon (or Edit button)
2. Edit screen opens with current data
3. **Screenshot 5A: Edit Form (Original Data)**
4. Change amount to "55.00" and description to "Updated: Had dessert too!"
5. **Screenshot 5B: Edit Form (Modified Data)**

**Key elements visible:**
- ✅ "Edit Expense" title
- ✅ Info banner: "Editing: Lunch at Restaurant"
- ✅ All fields pre-filled
- ✅ Title field
- ✅ Amount field
- ✅ Category dropdown
- ✅ Date picker
- ✅ Description field
- ✅ "Update Expense" button
- ✅ "Cancel" button

---

## 📱 SCREEN 6: Statistics Screen

**File:** `statistics_screen.dart`

**What to show:**
- Time period cards
- Category breakdown

**How to capture:**
1. From Home screen, tap Statistics icon (bar chart)
2. **Screenshot 6: Statistics Screen**

**Key elements visible:**
- ✅ "Statistics" title
- ✅ "Time Period" section
  - Today card with purple color
  - Week card with blue color
  - Month card with pink color
- ✅ "By Category" section
  - Food category with total and transaction count
  - Transport category
  - Shopping category
  - (All categories with expenses)
- ✅ Each category card shows:
  - Icon with colored background
  - Category name
  - Transaction count
  - Total amount in category color

---

## 📱 BONUS SCREENS

### Screenshot 7: Swipe to Delete
**How to capture:**
1. On home screen, swipe left on any expense (don't complete)
2. Red background with delete icon appears
3. **Screenshot 7: Swipe Delete Animation**

### Screenshot 8: Delete Success Message
**How to capture:**
1. Complete the swipe to delete
2. Green SnackBar appears: "[Expense name] deleted"
3. **Screenshot 8: Delete Success SnackBar**

### Screenshot 9: Add Success Message
**How to capture:**
1. Add a new expense
2. Green SnackBar appears: "Expense added successfully!"
3. **Screenshot 9: Add Success SnackBar**

### Screenshot 10: Update Success Message
**How to capture:**
1. Edit an expense and save
2. Green SnackBar appears: "Expense updated successfully!"
3. **Screenshot 10: Update Success SnackBar**

### Screenshot 11: Form Validation Error
**How to capture:**
1. Try to add expense with empty title
2. Tap "Save Expense"
3. Red error message appears under title field
4. **Screenshot 11: Validation Error**

### Screenshot 12: Empty Statistics
**How to capture:**
1. Delete all expenses
2. Open Statistics screen
3. Shows "No data to display" message
4. **Screenshot 12: Empty Statistics**

---

## 📋 Screenshot Checklist

### Required Screenshots (Main Features):
- [ ] 1. Home Screen - Empty State
- [ ] 2. Add Expense Screen - Empty Form
- [ ] 3. Add Expense Screen - Filled Form
- [ ] 4. Home Screen - With Multiple Expenses
- [ ] 5. Home Screen - Category Filter Active
- [ ] 6. Expense Details Screen
- [ ] 7. Edit Expense Screen
- [ ] 8. Statistics Screen

### Optional Screenshots (Additional Features):
- [ ] 9. Swipe to Delete Animation
- [ ] 10. Delete Success Message
- [ ] 11. Add Success Message
- [ ] 12. Update Success Message
- [ ] 13. Form Validation Error
- [ ] 14. Empty Statistics

---

## 🎨 Screenshot Tips

### For Best Quality:
1. **Clean the screen** - No fingerprints or smudges
2. **Good lighting** - Avoid glare
3. **Portrait orientation** - App is designed for portrait
4. **Full screen** - No notifications or system bars if possible
5. **Focus on content** - Make sure text is readable

### Android Screenshot Methods:
- **Power + Volume Down** - Hold both buttons simultaneously
- **Palm swipe** - Enable in settings, swipe edge of hand across screen
- **Screenshots save to:** Gallery → Screenshots folder

### Naming Convention:
```
01_home_empty.png
02_add_form_empty.png
03_add_form_filled.png
04_home_with_expenses.png
05_home_category_filter.png
06_expense_details.png
07_edit_expense.png
08_statistics.png
09_swipe_delete.png
10_delete_success.png
11_add_success.png
12_update_success.png
13_validation_error.png
14_statistics_empty.png
```

---

## 📱 Quick Screenshot Workflow

**For a complete set in 5 minutes:**

1. **Start fresh** - Delete all expenses or fresh install
2. **Screenshot #1** - Empty home screen
3. **Tap +** → Fill form → **Screenshot #2** (filled form)
4. **Save** → **Screenshot #3** (success message)
5. **Add 4 more expenses** (different categories)
6. **Screenshot #4** - Home with expenses
7. **Tap expense** → **Screenshot #5** (details)
8. **Tap Edit** → **Screenshot #6** (edit form)
9. **Go back** → Tap Statistics icon → **Screenshot #7** (statistics)
10. **Swipe expense** (don't complete) → **Screenshot #8** (swipe animation)

**Done!** You have all main screens captured.

---

## 🎯 Usage for Screenshots

### Portfolio/GitHub:
- Create a `screenshots/` folder in your repo
- Add images to README.md:
```markdown
## Screenshots

| Home Screen | Add Expense | Statistics |
|-------------|-------------|------------|
| ![Home](screenshots/01_home.png) | ![Add](screenshots/02_add.png) | ![Stats](screenshots/08_stats.png) |
```

### Documentation:
- Use in README.md to showcase features
- Add to QUICKSTART.md for visual guide
- Include in presentations or demos

### App Store/Play Store:
- Use for app listing screenshots
- Showcase key features
- Show clean, professional UI

---

**Ready to take screenshots!** 📸 

Once the app is running on your device, follow the guide above to capture all screens! ✨
