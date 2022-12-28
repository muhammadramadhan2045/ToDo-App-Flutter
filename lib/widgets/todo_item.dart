import 'package:flutter/material.dart';
import 'package:todolist_app/constants/colors.dart';
import 'package:todolist_app/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoo;
  final onToDoChanged;
  final onDeleteItem;
  const ToDoItem(
      {super.key,
      required this.todoo,
      required this.onToDoChanged,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todoo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: wrnaPutih,
        leading: Icon(
          todoo.isDone! ? Icons.check_box : Icons.check_box_outline_blank,
          color: wrnaBiru,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          todoo.todoText,
          style: TextStyle(
              fontSize: 16,
              color: wrnaHitam,
              decoration: todoo.isDone!
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: wrnaMerah,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            icon: const Icon(
              Icons.delete,
              color: wrnaPutih,
              size: 18,
            ),
            color: wrnaMerah,
            onPressed: () {
              onDeleteItem(todoo.id);
            },
          ),
        ),
      ),
    );
  }
}
