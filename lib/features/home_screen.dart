import 'package:expence/core/constants/add_transaction.dart';
import 'package:expence/core/constants/set_budget.dart';
import 'package:expence/core/constants/transaction_list.dart';
import 'package:expence/core/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => SetBudget(),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(child: TransactionList()),
            _buildBudgetSummary(transactionProvider),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (_) => AddTransaction(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // Widget to display the budget summary
  Widget _buildBudgetSummary(TransactionProvider transactionProvider) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monthly Budget: \$${transactionProvider.monthlyBudget.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Total Expenses: \$${transactionProvider.monthlyExpenses.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.redAccent),
              ),
              Text(
                'Remaining Budget: \$${transactionProvider.remainingBudget.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16, color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
