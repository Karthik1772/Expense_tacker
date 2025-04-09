import 'dart:convert'; // For JSON encoding/decoding
import 'package:expence/core/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];
  String _selectedCategory = 'All';
  double _monthlyBudget = 0.0; // Monthly budget field

  List<Transaction> get transactions {
    if (_selectedCategory == 'All') {
      return _transactions;
    } else {
      return _transactions
          .where((tx) => tx.category == _selectedCategory)
          .toList();
    }
  }

  String get selectedCategory => _selectedCategory;
  double get monthlyBudget => _monthlyBudget;

  List<String> get categories => [
    'All',
    'Food',
    'Transport',
    'Entertainment',
    'Others',
  ];

  TransactionProvider() {
    _loadTransactions(); // Load transactions when the provider is initialized
    _loadBudget(); // Load the monthly budget when initialized
  }

  // Set selected category for filtering transactions
  void setCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Add Transaction
  void addTransaction(
    String title,
    double amount,
    DateTime date,
    String category,
  ) async {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
      category: category,
    );
    _transactions.add(newTransaction);
    notifyListeners();
    await _saveTransactions(); // Save to shared preferences after adding a transaction
  }

  // Delete a Specific Transaction
  void deleteTransaction(String id) async {
    _transactions.removeWhere((tx) => tx.id == id);
    notifyListeners();
    await _saveTransactions(); // Save updated transactions list after deletion
  }

  // Calculate total expenses for the current month
  double get monthlyExpenses {
    final now = DateTime.now();
    return _transactions
        .where((tx) => tx.date.year == now.year && tx.date.month == now.month)
        .fold(0.0, (sum, item) => sum + item.amount);
  }

  // Calculate remaining budget
  double get remainingBudget {
    return _monthlyBudget - monthlyExpenses;
  }

  // Set a monthly budget
  void setMonthlyBudget(double budget) async {
    _monthlyBudget = budget;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('monthly_budget', budget); // Save to shared preferences
  }

  // Save Transactions to Shared Preferences
  Future<void> _saveTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> transactionList =
        _transactions
            .map(
              (tx) => json.encode({
                'id': tx.id,
                'title': tx.title,
                'amount': tx.amount,
                'date': tx.date.toIso8601String(),
                'category': tx.category,
              }),
            )
            .toList();
    prefs.setStringList('transactions', transactionList);
  }

  // Load Transactions from Shared Preferences
  Future<void> _loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final transactionList = prefs.getStringList('transactions');
    if (transactionList != null) {
      _transactions =
          transactionList.map((item) {
            final data = json.decode(item);
            return Transaction(
              id: data['id'],
              title: data['title'],
              amount: data['amount'],
              date: DateTime.parse(data['date']),
              category: data['category'],
            );
          }).toList();
      notifyListeners();
    }
  }

  // Load the monthly budget from Shared Preferences
  Future<void> _loadBudget() async {
    final prefs = await SharedPreferences.getInstance();
    _monthlyBudget = prefs.getDouble('monthly_budget') ?? 0.0;
    notifyListeners();
  }

  // Total Expenses Calculation
  double get totalExpenses {
    return _transactions.fold(0.0, (sum, item) => sum + item.amount);
  }
}
