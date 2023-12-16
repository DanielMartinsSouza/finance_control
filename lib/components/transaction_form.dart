import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  _submittedForm() {
    final String title = titleController.text;
    final double value = double.parse(valueController.text);

    if (value <= 0 || title == "" || title.isEmpty) {
      return;
    }

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => _submittedForm(),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: "Value (R\$)",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submittedForm(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              onPressed: _submittedForm,
              child: Text(
                "New Transaction",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
