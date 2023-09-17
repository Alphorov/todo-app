import 'package:flutter/material.dart';
import 'package:todo_app/src/feature/todo/model/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) => Container(
        height: MediaQuery.of(context).size.width * 0.4,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 4),
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                spreadRadius: 2)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Icon(
                Icons.cloud_circle_rounded,
                color: category.color,
              ),
              const Spacer(
                flex: 4,
              ),
              Text(category.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const Spacer(
                flex: 2,
              ),
              Text(
                '${category.tasks.length} tasks',
                style: const TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      );
}
