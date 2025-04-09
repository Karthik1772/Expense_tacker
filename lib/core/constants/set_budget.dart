import 'package:Xpenso/core/common/custom_buttons.dart';
import 'package:Xpenso/core/common/custom_textfield.dart';
import 'package:Xpenso/core/providers/transaction_provider.dart';
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 20),
            CustomTextField(
              controller: _budgetController,
              hint: "Monthly Budget",
            ),
            SizedBox(height: 20),
            CustomButtons(
              textSize: 13,
              width: 130,
              text: "Set Budget",
              onpressed: () => _submitBudget(context),
            ),
          ],
        ),
      ),
    );
  }
}
