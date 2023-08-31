import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool isCheck;
  Function(bool?)? onChanged;


  ToDoTile({super.key, required this.taskName, required this.isCheck,
   this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.purple[400],
          borderRadius: BorderRadius.circular(20)
        ),

        child: Row(
          children: [
            Checkbox(value: isCheck, onChanged: onChanged),
            Text(taskName,
            style: TextStyle(
              decoration: isCheck ? TextDecoration.lineThrough : TextDecoration.none
            ),
            )
          ],
        ),

      ),
    );
  }
}