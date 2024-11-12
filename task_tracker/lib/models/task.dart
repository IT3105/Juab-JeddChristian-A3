class Task {
  final int id;
  String text;
  String category;

  Task({
    required this.id,
    required this.text,
    required this.category,
  });

  Task copyWith({
    String? text,
    String? category,
  }) {
    return Task(
      id: id,
      text: text ?? this.text,
      category: category ?? this.category,
    );
  }
}