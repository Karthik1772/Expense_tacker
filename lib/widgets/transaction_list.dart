import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/providers/transaction_provider.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final transactions = transactionProvider.transactions;

    return Column(
      children: [
        _buildCategoryFilter(context),
        Expanded(
          child: transactions.isEmpty
              ? const Center(
                  child: Text(
                    'No transactions added yet!',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (ctx, index) {
                    final tx = transactions[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      elevation: 5,
                      child: ListTile(
                        title: Text(
                          tx.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                            '\$${tx.amount.toStringAsFixed(2)} - ${tx.category}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '${tx.date.day}/${tx.date.month}/${tx.date.year}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _confirmDelete(context, tx.id),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  // Widget to display category filters
  Widget _buildCategoryFilter(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final categories = transactionProvider.categories;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(category),
                selected: transactionProvider.selectedCategory == category,
                onSelected: (isSelected) {
                  transactionProvider.setCategory(category);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  // Method to confirm deletion of a transaction
  void _confirmDelete(BuildContext context, String transactionId) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to remove this transaction?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              Provider.of<TransactionProvider>(context, listen: false)
                  .deleteTransaction(transactionId);
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }
}
