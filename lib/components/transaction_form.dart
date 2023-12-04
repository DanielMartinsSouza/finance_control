import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  final Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

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
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: "Value (R\$)",
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.purple,
              ),
              onPressed: () {
                final String title = titleController.text;
                final double value = double.parse(valueController.text);
                onSubmit(title, value);
              },
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
