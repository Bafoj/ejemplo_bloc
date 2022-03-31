part of 'tasks_bloc.dart';

@immutable
abstract class TasksEvent {}

class TaskAddedEvent extends TasksEvent {
  final TaskModel task;
  TaskAddedEvent({required this.task});
}

class TaskDeletedEvent extends TasksEvent {
  final int index;
  TaskDeletedEvent({required this.index});
}

class TaskToggledEvent extends TasksEvent {
  final int index;
  TaskToggledEvent({required this.index});
}
