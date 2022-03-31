part of 'tasks_bloc.dart';

class TasksStateData with EquatableMixin {
  final List<TaskModel> tasks;
  TasksStateData({
    required this.tasks,
  });

  TasksStateData copyWith({
    List<TaskModel>? tasks,
  }) {
    return TasksStateData(
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [tasks];
}

@immutable
abstract class TasksState with EquatableMixin {
  final TasksStateData stateData;
  const TasksState({required this.stateData});
  TasksState copyWith(TasksStateData? stateData);
  @override
  List<Object?> get props => [stateData];
}

class TasksInitial extends TasksState {
  TasksInitial({TasksStateData? stateData})
      : super(stateData: stateData ?? TasksStateData(tasks: []));

  @override
  TasksState copyWith(TasksStateData? stateData) {
    return TasksInitial(stateData: stateData ?? this.stateData);
  }
}

class TaskAdded extends TasksState {
  const TaskAdded({required TasksStateData stateData})
      : super(stateData: stateData);
  @override
  TasksState copyWith(TasksStateData? stateData) {
    return TaskAdded(stateData: stateData ?? this.stateData);
  }
}

class TaskUpdated extends TasksState {
  const TaskUpdated({required TasksStateData stateData})
      : super(stateData: stateData);
  @override
  TasksState copyWith(TasksStateData? stateData) {
    return TaskUpdated(stateData: stateData ?? this.stateData);
  }
}

class TaskDeleted extends TasksState {
  const TaskDeleted({required TasksStateData stateData})
      : super(stateData: stateData);
  @override
  TasksState copyWith(TasksStateData? stateData) {
    return TaskDeleted(stateData: stateData ?? this.stateData);
  }
}
