# 💰 Expense Tracker App

A beautiful, functional Flutter mobile application for tracking personal expenses with category-based filtering, data persistence, and an intuitive user interface.

## 📋 Project Overview

**Developer:** priyadharshini1698727  
**Technology Stack:** Flutter, Dart, Provider (State Management), SQLite (Local Database)  
**Development Timeline:** 1 day (8 hours)  
**Development Approach:** Role-based development using 7 specialist perspectives

## ✨ Features

### Core Features (MVP - Implemented) ✅
- ✅ **Add Expense**: Form with validation (title, amount, category, date, description)
- ✅ **View Expenses**: Beautiful card-based list with newest first
- ✅ **Delete Expense**: Swipe-to-delete gesture with visual feedback
- ✅ **Edit Expense**: Update existing expense details
- ✅ **Expense Details**: Tap any expense to view full details
- ✅ **Category Filtering**: Filter by Food, Transport, Shopping, Bills, Other
- ✅ **Data Persistence**: SQLite database with CRUD operations
- ✅ **Total Calculation**: Real-time total for all/filtered expenses
- ✅ **Form Validation**: Required fields, numeric validation, positive amounts
- ✅ **Responsive UI**: Material Design with gradient headers and smooth animations
- ✅ **Empty States**: Helpful messages when no data exists

### Additional Features ✅
- ✅ **Statistics Screen**: View expenses by time period (today, week, month) and category
- ✅ **Category Icons**: Visual category identification with color coding
- ✅ **Date Picker**: Select past expense dates
- ✅ **Success Feedback**: SnackBar notifications for user actions

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                          # App entry point with Provider setup
├── constants/
│   ├── app_theme.dart                 # Design system & theme configuration
│   └── categories.dart                # Category constants with icons & colors
├── models/
│   └── expense_model.dart             # Expense data model
├── screens/
│   ├── home_screen.dart               # Main screen with expense list
│   ├── add_expense_screen.dart        # Form to add new expense
│   ├── edit_expense_screen.dart       # Form to edit existing expense
│   ├── expense_details_screen.dart    # Full details view for an expense
│   └── statistics_screen.dart         # Statistics and analytics view
├── widgets/
│   ├── expense_card.dart              # Reusable expense card with swipe-to-delete
│   ├── category_filter.dart           # Horizontal category filter chips
│   └── stat_card.dart                 # Statistics display card
├── services/
│   └── database_service.dart          # SQLite database operations
└── providers/
    └── expense_provider.dart          # State management with Provider
```

### Design Pattern
- **MVVM-like Architecture** with Provider for state management
- **Singleton Pattern** for database service
- **Repository Pattern** for data access
- **Observer Pattern** via ChangeNotifier

### Database Schema
```sql
CREATE TABLE expenses (
  id TEXT PRIMARY KEY,        -- UUID
  title TEXT NOT NULL,        -- Expense title
  amount REAL NOT NULL,       -- Amount in currency
  category TEXT NOT NULL,     -- Food, Transport, Shopping, Bills, Other
  date TEXT NOT NULL,         -- ISO8601 date string
  description TEXT            -- Optional notes
)
```

## 🎨 Design System

### Color Palette
- **Primary Purple**: #6C63FF (Main brand color)
- **Secondary Pink**: #FF6584 (Accents)
- **Category Colors**:
  - Food: Orange (#FF9800)
  - Transport: Blue (#2196F3)
  - Shopping: Pink (#E91E63)
  - Bills: Red (#F44336)
  - Other: Grey (#9E9E9E)

### UI Components
- Card-based layout for expenses
- Gradient backgrounds for emphasis
- Material Design principles
- Smooth animations and transitions
- Bottom sheet modals for actions
- Consistent spacing (8dp, 16dp, 24dp)
- Border radius (8dp, 12dp, 16dp)

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Windows/Mac/Linux for desktop OR Android/iOS device/emulator for mobile

### Installation

1. **Clone the repository** (or navigate to the project directory)
```bash
cd d:\Expense-Tracker
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
# For Windows desktop
flutter run -d windows

# For Android
flutter run -d android

# For iOS
flutter run -d ios

# For Chrome web
flutter run -d chrome
```

### Building for Release

```bash
# Windows
flutter build windows

# Android
flutter build apk

# iOS
flutter build ios
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5      # State management
  sqflite: ^2.3.0       # Local SQLite database
  path: ^1.8.3          # Path utilities
  intl: ^0.18.1         # Date formatting
  uuid: ^4.0.0          # UUID generation
  cupertino_icons: ^1.0.2
```

## 📱 How to Use

### Adding an Expense
1. Tap the **+ Add Expense** floating action button
2. Fill in the required fields:
   - **Title**: Name of the expense (e.g., "Groceries")
   - **Amount**: Cost in dollars (e.g., "45.50")
   - **Category**: Select from dropdown (Food, Transport, Shopping, Bills, Other)
   - **Date**: Choose date from calendar picker
   - **Description** (optional): Add notes
3. Tap **Save Expense**
4. Success notification appears, and you return to the home screen

### Viewing Expenses
- All expenses are displayed on the home screen
- **Total** is shown in the gradient header
- **Item count** is displayed in the top-right badge
- Each card shows: Icon, Title, Category, Date, Amount
- Scroll to view all expenses

### Filtering by Category
- Tap category filter chips at the top
- Choose: All, Food, Transport, Shopping, Bills, or Other
- List and total update automatically
- Selected category is highlighted with its color

### Deleting an Expense
- **Swipe left** on any expense card
- Red delete background appears
- Complete the swipe to delete
- Confirmation message appears

### Viewing Expense Details (NEW!)
- **Tap** on any expense card in the list
- View full details including:
  - Large amount display with gradient header
  - Category icon and badge
  - Full date and time information
  - Complete description text
  - Unique expense ID for reference
- Quick access to **Edit** button from details screen

### Editing an Expense (NEW!)
- Tap on an expense to view details
- Click the **Edit** icon in the app bar OR
- Click the **Edit** button at the bottom
- Modify any field (title, amount, category, date, description)
- Form shows current values pre-filled
- Click **Update Expense** to save changes
- Success notification appears
- Returns to home screen with updated expense

### Viewing Statistics
- Navigate to the Statistics screen (optional feature)
- View totals for Today, Week, Month
- See breakdown by category
- Transaction counts per category

## 🧪 Testing Checklist

### Functional Tests
- ✅ Add expense with valid data → Saves and appears in list
- ✅ Add expense without title → Shows validation error
- ✅ Add expense with invalid amount → Shows validation error
- ✅ Delete expense → Removes from list and database
- ✅ Filter by category → Shows only matching expenses
- ✅ App restart → Data persists correctly
- ✅ Empty list → Shows placeholder message
- ✅ Date selection → Allows past dates only
- ✅ Swipe to delete → Shows delete background
- ✅ Total calculation → Accurate for all scenarios

### UI Tests
- ✅ Responsive layout on different screen sizes
- ✅ Smooth animations and transitions
- ✅ Consistent color scheme throughout
- ✅ Proper spacing and alignment
- ✅ Icons display correctly
- ✅ Text overflow handling
- ✅ Loading states for async operations
- ✅ Success/error feedback messages

## 🎭 Development Roles Used

This project was developed using a **7-role specialist approach**:

1. **UI/UX Designer 🎨**: Designed the visual system, color scheme, and user flows
2. **Software Architect 🏗️**: Structured the codebase and defined patterns
3. **Frontend Developer 💻**: Built all UI components and screens
4. **Database Engineer 🗄️**: Implemented SQLite database with CRUD operations
5. **State Management Specialist 🔧**: Created Provider for reactive state
6. **QA Tester 🧪**: Tested all features and edge cases
7. **Project Manager 📋**: Planned timeline and prioritized features

## 📈 Future Enhancements (P2 - Nice to Have)

- [ ] **Edit Expense**: Modify existing expenses
- [ ] **Search**: Search expenses by title or description
- [ ] **Date Range Filter**: Filter by custom date range
- [ ] **Export to CSV**: Export expense data
- [ ] **Charts**: Visual graphs for spending trends
- [ ] **Budget Goals**: Set and track monthly budgets
- [ ] **Recurring Expenses**: Automatic monthly expenses
- [ ] **Multiple Currencies**: Support for different currencies
- [ ] **Dark Mode**: Dark theme option
- [ ] **Cloud Sync**: Backup data to cloud

## 🐛 Known Issues

None at this time! All core features are working as expected.

## 📄 License

This project is for educational purposes.

## 👨‍💻 Developer

**priyadharshini1698727**  
Developed using AI-assisted coding with role-based thinking approach

---

## 🎯 Success Criteria - All Met! ✅

- ✅ Runs without crashes
- ✅ Add expenses with validation
- ✅ Display expenses in a list
- ✅ Delete expenses (swipe gesture)
- ✅ Filter by category
- ✅ Show accurate totals
- ✅ Persist data after restart
- ✅ Clean, professional UI
- ✅ Follow Material Design
- ✅ Well-structured and maintainable

**Project Status**: ✅ **COMPLETE** - All MVP features implemented and tested!

---

*Built with Flutter 💙 | Powered by AI 🤖 | Role-Based Development 🎭*
