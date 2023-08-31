import 'package:flutter/material.dart';

class popUp extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  popUp({super.key, 
  required this.controller,
  required this.onSave,
  required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.purple,
      title: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: "Nova Tarefa",
        ),
        ),
      actions: [
        MaterialButton(
          onPressed: onCancel,
          child: Text("Cancel"),
          color: Colors.purple[700],
          elevation: 5,
        ),
        MaterialButton(
          onPressed: onSave,
          child: Text("Ok"),
          color: Colors.purple[700],
          elevation: 5,
        ),
      ],
    );
  }
}