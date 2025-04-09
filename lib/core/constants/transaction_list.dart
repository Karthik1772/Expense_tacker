import 'package:expence/core/common/custom_buttons.dart';
import 'package:expence/core/providers/transaction_provider.dart';
import 'package:expence/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
          child:
              transactions.isEmpty
                  ? Center(
                    child: Text(
                      'No transactions added yet!',
                      style: GoogleFonts.workSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  )
                  : ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (ctx, index) {
                      final tx = transactions[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: AppColors.orange),
                        ),
                        shadowColor: AppColors.lightorange,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 10,
                        ),
                        elevation: 5,
                        child: ListTile(
                          title: Text(
                            tx.title,
                            style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '\$${tx.amount.toStringAsFixed(2)} - ${tx.category}',
                            style: GoogleFonts.quicksand(
                              fontSize: 14,
                              color: AppColors.grey,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                '${tx.date.day}/${tx.date.month}/${tx.date.year}',
                                style: GoogleFonts.quicksand(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.red,
                                ),
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
          children:
              categories.map((category) {
                final isSelected =
                    transactionProvider.selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    showCheckmark: false,
                    label: Text(
                      category,
                      overflow: TextOverflow.visible,
                      style: GoogleFonts.quicksand(
                        fontSize: 14,
                        color: isSelected ? AppColors.white : AppColors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      transactionProvider.setCategory(category);
                    },
                    selectedColor: AppColors.orange,
                    backgroundColor: AppColors.white,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color:
                            isSelected
                                ? AppColors.orange
                                : Colors.grey.shade400,
                        width: 1.5,
                      ),
                    ),
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
      builder:
          (ctx) => AlertDialog(
            backgroundColor: AppColors.white,
            title: Text(
              'Are you sure?',
              style: GoogleFonts.varelaRound(
                fontSize: 28,
                color: AppColors.orange,
              ),
            ),
            content: Text(
              'Do you want to remove this transaction?',
              style: GoogleFonts.varelaRound(
                fontSize: 13,
                color: AppColors.orange,
              ),
            ),
            actions: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtons(
                      textSize: 13,
                      text: "Cancel",
                      width: 92,
                      onpressed: () {
                        Navigator.of(ctx).pop();
                      },
                    ),
                    CustomButtons(
                      textSize: 13,
                      width: 92,
                      text: "Delete",
                      onpressed: () {
                        Provider.of<TransactionProvider>(
                          context,
                          listen: false,
                        ).deleteTransaction(transactionId);
                        Navigator.of(ctx).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
