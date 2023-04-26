import 'package:flutter/material.dart';

class Lista extends StatelessWidget {
  Lista({super.key});

  final List texto = ["A", "B", "C", "D", "E", "F"];
  final List icons = [
    Icons.cake,
    Icons.calendar_month_outlined,
    Icons.account_balance
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          color: Colors.grey[600],
          child: ListTile(
              leading: Icon(Icons.person),
              title: Text("Usuário " + texto[index % texto.length])),
        );
      },
    );
  }
}