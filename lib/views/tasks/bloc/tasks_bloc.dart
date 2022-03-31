import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../models/task_model.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksStateData get stateData => state.stateData;
  TasksBloc() : super(TasksInitial()) {
    on<TaskAddedEvent>((event, emit) {
      if (event.task.content.isEmpty) return;
      final List<TaskModel> copy = List.from(stateData.tasks);
      emit(TaskAdded(
          stateData: stateData.copyWith(tasks: copy..add(event.task))));
    });
    on<TaskDeletedEvent>((event, emit) {
      final List<TaskModel> copy = List.from(stateData.tasks);
      emit(TaskDeleted(
          stateData: stateData.copyWith(tasks: copy..removeAt(event.index))));
    });
    on<TaskToggledEvent>((event, emit) {
      final List<TaskModel> copy = List.from(stateData.tasks);
      copy[event.index] =
          copy[event.index].copyWith(done: !copy[event.index].done);
      emit(TaskUpdated(stateData: stateData.copyWith(tasks: copy)));
    });
  }
}
