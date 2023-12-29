import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submittedForm() {
    final String title = _titleController.text;
    final double value = double.parse(_valueController.text);

    if (value <= 0 || title == "" || title.isEmpty) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _showDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((datePicker) {
      if (datePicker == null) {
        return;
      }
      setState(() {
        _selectedDate = datePicker;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              onSubmitted: (_) => _submittedForm(),
            ),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                labelText: "Value (R\$)",
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submittedForm(),
            ),
            Container(
              height: 75,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No data selected!"
                          : "Date: ${DateFormat("dd/MM/y").format(_selectedDate)}",
                    ),
                  ),
                  TextButton(
                    onPressed: _showDataPicker,
                    child: Text(
                      "Select date",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submittedForm,
              child: Text(
                "New Transaction",
                style: TextStyle(
                  color: Theme.of(context)
                      .elevatedButtonTheme
                      .style
                      ?.textStyle
                      ?.resolve({})?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
