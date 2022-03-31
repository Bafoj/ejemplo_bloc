import 'package:flutter/material.dart';

import '../../models/task_model.dart';
import '../../widgets/custom_card.dart';
import 'widgets/task.dart';
import 'widgets/task_input.dart';

class Tasks extends StatelessWidget {
  const Tasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      backgroundColor: Color.fromARGB(255, 110, 111, 189),
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<TaskModel> tasks = [];
  GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
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
                setState(() {
                  tasks.add(TaskModel(content: s, done: false));
                  key.currentState?.insertItem(tasks.length - 1);
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.separated(
                key: key,
                physics: const BouncingScrollPhysics(),
                itemCount: tasks.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  var task = tasks[index];
                  return Task(
                    title: task.content,
                    done: task.done,
                    onDelete: () {
                      setState(() {
                        tasks.removeAt(index);
                      });
                    },
                    onTap: () {
                      setState(() {
                        tasks[index] = task.copyWith(done: !task.done);
                      });
                    },
                  );
                },
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
