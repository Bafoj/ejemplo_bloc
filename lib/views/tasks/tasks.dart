import 'package:ejemplo_bloc/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_card.dart';
import 'bloc/tasks_bloc.dart';
import 'widgets/task.dart';
import 'widgets/task_input.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => TasksBloc(),
        child: const Body(),
      ),
      backgroundColor: const Color.fromARGB(255, 110, 111, 189),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCard(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: const Text(
                'BLOC TODOS',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 9, 4, 71)),
              ),
            ),
            TaskInput(
              onSubmit: (s) {
                context.read<TasksBloc>().add(
                    TaskAddedEvent(task: TaskModel(content: s, done: false)));
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return ListView.separated(
                    key: key,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.stateData.tasks.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (c, i) => _buildTask(c, i, state),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, int index, TasksState state) {
    var task = state.stateData.tasks[index];
    return Task(
      key: Key('$index${task.content}'),
      title: task.content,
      done: task.done,
      onDelete: () {
        context.read<TasksBloc>().add(TaskDeletedEvent(
              index: index,
            ));
      },
      onTap: () {
        context.read<TasksBloc>().add(TaskToggledEvent(index: index));
      },
    );
  }
}
