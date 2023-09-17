import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_app/src/feature/todo/model/task_model.dart';

class Category {
  const Category({
    required this.id,
    required this.name,
    required this.color,
    this.tasks = const [],
  });

  final int id;
  final String name;
  final Color color;

  final List<Task> tasks;

  static final List<String> names = ['Work', 'Study', 'Home', 'Other'];

  factory Category.mock() => Category(
        id: 1,
        name: List.generate(
          1,
          (index) => names[Random().nextInt(
            names.length,
          )],
        ).first,
        color: const Color.fromARGB(255, 251, 154, 154),
      );
}
