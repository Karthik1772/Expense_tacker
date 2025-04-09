import 'package:expence/core/common/custom_textfield.dart';
import 'package:expence/core/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SetBudget extends StatelessWidget {
  final _budgetController = TextEditingController();

  SetBudget({super.key});

  void _submitBudget(BuildContext context) {
    final enteredBudget = double.tryParse(_budgetController.text);
    if (enteredBudget == null || enteredBudget <= 0) {
      return;
    }
    Provider.of<TransactionProvider>(
      context,
      listen: false,
    ).setMonthlyBudget(enteredBudget);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CustomTextField(
              controller: _budgetController,
              hint: "Monthly Budget",
            ),
            ElevatedButton(
              child: const Text('Set Budget'),
              onPressed: () => _submitBudget(context),
            ),
            // CustomButtons(
            //   text: "Set Budget",
            //   onpressed: () => _submitBudget(context),
            // ),
          ],
        ),
      ),
    );
  }
}
