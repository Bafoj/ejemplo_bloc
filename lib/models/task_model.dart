class TaskModel {
  final String content;
  final bool done;
  TaskModel({
    required this.content,
    required this.done,
  });

  TaskModel copyWith({
    String? content,
    bool? done,
  }) {
    return TaskModel(
      content: content ?? this.content,
      done: done ?? this.done,
    );
  }
}
