class Task {
  const Task({
    required this.id,
    required this.title,
    required this.creationDate,
    this.dueDate,
    this.description,
  });

  final int id;
  final String title;
  final String? description;
  final DateTime creationDate;
  final DateTime? dueDate;

  factory Task.mock() => Task(
        id: 1,
        title: 'Mock task',
        creationDate: DateTime.now(),
      );
}
