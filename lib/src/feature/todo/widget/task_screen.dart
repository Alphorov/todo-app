import 'package:flutter/material.dart';
import 'package:todo_app/src/common/widget/appbar.dart';
import 'package:todo_app/src/feature/todo/model/category_model.dart';
import 'package:todo_app/src/feature/todo/widget/category_detail_view.dart';
import 'package:todo_app/src/feature/todo/widget/category_list.dart';
import 'package:todo_app/src/feature/todo/widget/horizontal_selection.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({super.key});

  final List<Category> list = List.generate(
    4,
    (index) => Category.mock(),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomAppBar(
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(
            //     Icons.menu,
            //     color: Colors.grey,
            //   ),
            // ),
            ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 32, top: 16, bottom: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Hey User,\nhere is your to-do list.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const HorizontalSelection(items: ['Today', 'Week', 'Month']),
              const SizedBox(
                height: 48,
              ),
              Center(
                child: CategoryList(
                  items: list,
                  onTap: (index) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoryDetailVeiw(
                        category: list[index],
                      ),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
