import 'package:flutter/material.dart';

class TaskInput extends StatefulWidget {
  final void Function(String) onSubmit;
  const TaskInput({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<TaskInput> createState() => _TaskInputState();
}

class _TaskInputState extends State<TaskInput> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(left: 10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  primary: const Color.fromARGB(255, 61, 22, 128)),
              child: const Icon(Icons.add, size: 30),
              onPressed: () {
                widget.onSubmit(_controller.text);
                _controller.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
