import 'package:Xpenso/core/common/custom_buttons.dart';
import 'package:Xpenso/core/common/custom_drop.dart';
import 'package:Xpenso/core/common/custom_textfield.dart';
import 'package:Xpenso/core/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dropDownController = TextEditingController();

  String _selectedCategory = 'Food';
  final List<String> _categories = [
    'Food',
    'Transport',
    'Entertainment',
    'Others',
  ];

  void _submitData() {
    if (_amountController.text.isEmpty) return;

    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);
    final selectedCategory = _dropDownController.text;

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        selectedCategory.isEmpty)
      return;

    Provider.of<TransactionProvider>(context, listen: false).addTransaction(
      enteredTitle,
      enteredAmount,
      DateTime.now(),
      selectedCategory,
    );

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _dropDownController.text = _selectedCategory;
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
            CustomTextField(controller: _titleController, hint: 'Title'),
            SizedBox(height: 10),
            CustomTextField(controller: _amountController, hint: 'Amount'),
            SizedBox(height: 20),
            CustomDropDown(
              list: _categories,
              dropDownController: _dropDownController,
              hintText: 'Select Category',
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            const SizedBox(height: 10),
            CustomButtons(
              text: "Add Transaction",
              onpressed: _submitData,
              textSize: 20,
            ),
          ],
        ),
      ),
    );
  }
}

