import 'package:flutter/material.dart';
import 'package:todo_app/src/feature/todo/widget/category_card.dart';

import '../model/category_model.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.items, required this.onTap});

  final List<Category> items;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: 32,
        runSpacing: 32,
        children: [
          for (int i = 0; i < items.length; i++)
            InkWell(
              onTap: () => onTap(i),
              child: CategoryCard(
                category: items[i],
              ),
            ),
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Color.fromARGB(255, 109, 194, 112),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          )
        ],
      );
}
