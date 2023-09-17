import 'package:flutter/material.dart';
import 'package:todo_app/src/common/widget/appbar.dart';
import 'package:todo_app/src/feature/todo/model/category_model.dart';

class CategoryDetailVeiw extends StatelessWidget {
  const CategoryDetailVeiw({
    required this.category,
    super.key,
  });

  final Category category;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cloud_circle_rounded,
                    color: category.color,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Text(
                  '${category.tasks.length} Tasks',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
