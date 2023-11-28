import 'package:finance_control/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(
      id: "t1",
      title: "Tenis",
      value: 300.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Camisa",
      value: 150.50,
      date: DateTime.now(),
    ),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Expenses"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text("Colocar o grafico aqui"),
              color: Colors.blue,
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((transactionMap) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(transactionMap.value.toString()),
                    ),
                    Column(
                      children: <Widget>[
                        Text(transactionMap.title),
                        Text(transactionMap.date.toString())
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
